package main

import (
	"encoding/xml"
	"fmt"
	"net/http"
	"sync"
)

var Address = []string{
	"http://feeds.bbci.co.uk/news/rss.xml",
	"https://podcasts.files.bbci.co.uk/p02nrvz8.rss",
}

type channel struct {
	Title    string    `xml:"title"`
	Link     string    `xml:"link"`
	Desc     string    `xml:"description"`
	RssItems []RssItem `xml:"item"`
}

type rss struct {
	Channel channel `xml:"channel"`
}

type RssItem struct {
	Title       string `xml:"title"`
	Source      string `xml:"source"`
	SourceURL   string `xml:"sourceUrl"`
	Link        string `xml:"link"`
	PubDate     string `xml:"pubDate"`
	Description string `xml:"description"`
}

func Parse(Address []string) []RssItem {

	rss := rss{}
	var wg sync.WaitGroup

	for i := 0; i < len(Address); i++ {
		wg.Add(1)
		go func(url string) {
			defer wg.Done()

			resp, err := http.Get(Address[i])
			if err != nil {
				fmt.Printf("Error GET: %v\n", err)
				return
			}
			defer resp.Body.Close()

			decoder := xml.NewDecoder(resp.Body)
			err = decoder.Decode(&rss)
			if err != nil {
				fmt.Printf("Error Decode: %v\n", err)
				return
			}
		}(Address[i])
		wg.Wait()
	}
	return rss.Channel.RssItems
}

func main() {
	b := Parse(Address)

	for i, item := range b {
		fmt.Printf("%v. item Title: %v\n", i, item.Title)
	}

}

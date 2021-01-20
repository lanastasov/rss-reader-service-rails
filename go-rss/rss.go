// package rss
package main

import (
	"fmt"
	"time"
)

var Address = []string{
	"https://www.reddit.com/.rss",
	"https://podcasts.files.bbci.co.uk/p02nrvz8.rss",
}

type RssItem struct {
	Title       string
	Source      string
	SourceURL   string
	Link        string
	PublishDate time.Time
	Description string
}

func Parse(Adress []string) []RssItem {
	fmt.Println(Adress[0])
	now := time.Now()
	rss := []RssItem{
		RssItem{
			Title:       "title",
			Source:      "source",
			SourceURL:   "sourceURL",
			Link:        "link",
			PublishDate: now,
			Description: "desc",
		},
		RssItem{
			Title:       "title1",
			Source:      "source1",
			SourceURL:   "sourceURL1",
			Link:        "link1",
			PublishDate: now,
			Description: "desc1",
		},
	}
	return rss
}

func main() {
	b := Parse(Address)[0]
	fmt.Println(b)
}

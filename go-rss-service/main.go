package main

import (
	"encoding/json"
	"fmt"
	"log"
	"os"

	rss "../go-rss"
)

func RssToJSON(Address []string) []byte {
	rssJson, err := json.Marshal(rss.Parse(Address))
	if err != nil {
		log.Fatal("Cannot encode to JSON ", err)
	}
	return rssJson
}

func main() {
	var Address = []string{
		"http://feeds.bbci.co.uk/news/rss.xml",
		"https://podcasts.files.bbci.co.uk/p02nrvz8.rss",
	}

	fmt.Fprintf(os.Stdout, "%s", RssToJSON(Address))
}

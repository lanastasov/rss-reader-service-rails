json.extract! rssurl, :id, :url, :created_at, :updated_at
json.url rssurl_url(rssurl, format: :json)

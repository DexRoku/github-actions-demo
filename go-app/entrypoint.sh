#!/bin/sh


GITHUB_TOKEN=$1
GIPHY_API_KEY=$2

pull_request = $(jq --raw-output .pull_request "$GITHUB_EVENT_PATH")
echo "Pull Request: $pull_request"

giphy_response=$(curl -s "https://api.giphy.com/v1/gifs/translate?api_key=$GIPHY_API_KEY&tag=happy")
echo "Giphy Response: $giphy_response"


gif_url=$(echo "$giphy_response" | jq --raw-output '.data.images.downsized.url')
echo "GIF URL: $gif_url"

comment_response=$(curl -s -X POST \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "body": "Here is a GIF for you: '"$gif_url"'"
  }' \
  "$GITHUB_API_URL/repos/$GITHUB_REPOSITORY/issues/$pull_request/comments")

echo "Comment Response: $comment_response"
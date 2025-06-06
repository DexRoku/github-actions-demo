#!/bin/sh

GITHUB_TOKEN=$1
GIPHY_API_KEY=$2


pull_request_number = $(jq --raw-output '.pull_request.number' "$GITHUB_EVENT_PATH")
echo "Pull Request Number: $pull_request_number"


giphy_response=$(curl -s "https://api.giphy.com/v1/gifs/random?api_key=$GIPHY_API_KEY&tag=funny&rating=g")
echo "Giphy Response: $giphy_response"

gif_url=$(echo "$giphy_response" | jq --raw-output '.data.images.downsized_medium.url')

echo "GIF URL: $gif_url"

comment_response=$(curl -s -X POST \
  -H "Authorization: TOKEN $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github.v3+json" \
  -d "{\"body\": \"![GIF]($gif_url)\"}" \
  "https://api.github.com/repos/$GITHUB_REPOSITORY/issues/$pull_request_number/comments")
echo "Comment Response: $comment_response"
if echo "$comment_response" | grep -q '"id":'; then
  echo "Comment posted successfully."
else
  echo "Failed to post comment."
  exit 1
fi

comment_url=$(echo "$comment_response" | jq --raw-output '.html_url')
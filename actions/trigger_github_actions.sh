#!/bin/bash
echo "$(date) - Triggering GitHub Actions..."

curl -s \
  -H 'Accept: application/vnd.github.v3+json' \
  -X POST \
  -d '{"ref":"'"$REFERENCE"'"}' \
  -u "$USER:$PERSONAL_ACCESS_TOKEN" \
  "https://api.github.com/repos/$REPOSITORY/actions/workflows/$WORKFLOW_ID/dispatches" || {
    echo "$(date) - Request failed"
    exit 1
  }

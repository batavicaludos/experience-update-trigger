#!/bin/bash
parse_field ()
{
  value=$(python3 -c "import json, codecs; print(json.loads('$1'.encode('utf-8').decode('utf-8-sig'))['$2'])")
  if [ $? -ne 0 ]; then
    echo "Something went wrong while parsing the field"
    exit 1
  fi
  echo "$value"
}

response=$(curl https://develop.roblox.com/v1/universes/253889617)
echo "$response"

updated_at=$(parse_field "$response" "updated")
echo "$updated_at"
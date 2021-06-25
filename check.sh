#!/bin/bash
CHECK_INTERVAL=$(( 60 * 1000 ))

parse_date ()
{
  date -d"$1" +'%s%3N'
}

current_date=$(date +'%Y-%m-%dT%H:%M:%S.%3N%:z')
current_date_ms=$(parse_date "$current_date")

updated_at=$(curl -s "https://games.roblox.com/v1/games?universeIds=$UNIVERSE_ID" | jq -er '.data[0].updated') || {
  echo "$(date) - Could not get last updated date"
  exit 1
}
updated_at_ms=$(parse_date "$updated_at")

if (( current_date_ms - updated_at_ms <= CHECK_INTERVAL )); then
  bash actions/"$ACTION_NAME".sh "$UNIVERSE_ID"
fi

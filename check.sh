#!/bin/bash
CHECK_INTERVAL=$(( 60 * 1000 ))

parse_json_field ()
{
  if ! value=$(python3 parse_json_field.py "$1" "$2"); then
    return 1
  fi
  echo "$value"
}

parse_date ()
{
  date -d"$1" +'%s%3N'
}

current_date=$(date +'%Y-%m-%dT%H:%M:%S.%3N%:z')
current_date_ms=$(parse_date "$current_date")

response=$(curl -s "https://games.roblox.com/v1/games?universeIds=$UNIVERSE_ID")
updated_at=$(parse_json_field "$response" 'updated') || {
  echo "$(date) - Something went wrong while parsing the field"
  exit 1
}
updated_at_ms=$(parse_date "$updated_at")

if (( current_date_ms - updated_at_ms <= CHECK_INTERVAL )); then
  bash actions/"$ACTION_NAME".sh "$UNIVERSE_ID"
fi

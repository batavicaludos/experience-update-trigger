#!/bin/bash
CHECK_INTERVAL=$(( 60 * 1000 ))
DATE_FORMAT='%Y-%m-%dT%H:%M:%S.%3N%:z'

parse_json_field ()
{
  value=$(python3 parse_json_field.py "$1" $2)
  if [ $? -ne 0 ]; then
    return 1
  fi
  echo "$value"
}

parse_date ()
{
  echo $(date -d"$1" +'%s%3N')
}

current_date=$(date +"$DATE_FORMAT")
current_date_ms=$(parse_date $current_date)
echo $current_date
echo $current_date_ms

response=$(curl https://develop.roblox.com/v1/universes/2639068927)
echo "$response"

updated_at=$(parse_json_field "$response" 'updated') || {
  echo 'Something went wrong while parsing the field'
  exit
}
updated_at_ms=$(parse_date $updated_at)
echo $updated_at
echo $updated_at_ms
echo $(( $current_date_ms - $updated_at_ms ))
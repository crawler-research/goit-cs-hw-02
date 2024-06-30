#!/bin/bash

websites=("google.com" "facebook.com" "twitter.com")

logfile="website_status.log"

for website in "${websites[@]}"
do
  status_code=$(curl --write-out "%{http_code}" --silent --output /dev/null $website)

  if [ $status_code -eq 200 ]; then
    echo "$website is UP" >> $logfile
  else
    echo "$website is DOWN" >> $logfile
  fi
done

echo "Results have been written to $logfile"
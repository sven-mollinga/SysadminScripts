#!/bin/bash

DOMAIN=$1

NOW=`date +%s`
THEN=`date --date="$(echo | openssl s_client -showcerts -servername $DOMAIN -connect $DOMAIN:443 2>/dev/null| openssl x509 -noout -dates|grep "notAfter"|awk -F "=" '{print $2}')" +%s`

let DIFF=$THEN-$NOW
DAYS= expr $DIFF / 86400


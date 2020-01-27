#!/bin/bash
PROXY="$1"
if [ "$PROXY" == "" ]; then
  echo -e "\nERROR: Please pass the base proxy URL, such as: http://IP:6764\n"
  exit 1
fi

if [[ $PROXY != http* ]]; then
  PROXY="http://$PROXY"
fi

echo -e "Using proxy: $PROXY"

echo -e "\nPlease enter the password for admin: "; read -s passwd
echo ""

curl -u "admin:${passwd}" "$PROXY/api/apps/lab4/spark/configurations" -XPOST -H"Content-type:application/json" \
  --data-binary @load_data_from_gcs_pbl.json
echo ""

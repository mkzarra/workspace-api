#!/bin/bash

curl "http://localhost:4741/stores" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "store": {
      "name": "'"${NAME}"'",
      "schedule": "'"${SCHEDULE}"'",
      "wifi": "'"${WIFI}"'",
      "outlets": "'"${OUTLETS}"'",
      "restrooms": "'"${RESTROOMS}"'",
      "seating": "'"${SEATING}"'",
      "atmosphere": "'"${ATMOSPHERE}"'"
    }
  }'

echo

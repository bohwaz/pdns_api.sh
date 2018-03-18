#!/bin/bash

_TEST "V1 Multiple records"
_SUBTEST "Deploy"
_RUN 'deploy_challenge host1.example.com _ token1 host2.example.com _ token2' \
'PATCH http://hostname:8000/api/v1/servers/servername/zones/example.com.' \
'{
  "rrsets": [
    {
      "name": "_acme-challenge.host2.example.com.",
      "type": "TXT",
      "ttl": 1,
      "records": [
        {
          "content": "\"token2\"",
          "disabled": false,
          "set-ptr": false
        }
      ],
      "changetype": "REPLACE"
    },
    {
      "name": "_acme-challenge.host1.example.com.",
      "type": "TXT",
      "ttl": 1,
      "records": [
        {
          "content": "\"token1\"",
          "disabled": false,
          "set-ptr": false
        }
      ],
      "changetype": "REPLACE"
    }
  ]
}'

_SUBTEST "Clean"
_RUN 'deploy_challenge host1.example.com _ token1 host2.example.com _ token2' \
'PATCH http://hostname:8000/api/v1/servers/servername/zones/example.com.' \
'{
  "rrsets": [
    {
      "name": "_acme-challenge.host2.example.com.",
      "type": "TXT",
      "ttl": 1,
      "records": [
        {
          "content": "\"token2\"",
          "disabled": false,
          "set-ptr": false
        }
      ],
      "changetype": "REPLACE"
    },
    {
      "name": "_acme-challenge.host1.example.com.",
      "type": "TXT",
      "ttl": 1,
      "records": [
        {
          "content": "\"token1\"",
          "disabled": false,
          "set-ptr": false
        }
      ],
      "changetype": "REPLACE"
    }
  ]
}'

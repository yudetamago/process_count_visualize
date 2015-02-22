#!/bin/sh
elasticsearch &
sleep 10
rm log/*.log
curl -XDELETE localhost:9200/prosess_count-2015.02.22/
curl -XPUT localhost:9200/_template/process_count -d '
{
    "template": "process_count-*",
    "mappings": {
      "process_count": {
        "properties": {
          "@timestamp": {
            "type": "date",
            "format": "dateOptionalTime"
          },
          "process": {
            "type": "integer"
          }
        }
      }
    }
  }
'
sleep 1
pgrep -f elasticsearch | xargs kill -9

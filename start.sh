#!/bin/sh
fluentd -c ./config/fluent/fluent.conf &
elasticsearch &
sleep 10s
HTTP_RESPONSE=`curl -LI localhost:9200 -o /dev/null -w '%{http_code}\n' -s`
if [ ${HTTP_RESPONSE} -eq 200 ]; then
#  nohup bundle exec clockwork script/write_log.rb > /dev/null 2>&1 &
  bundle exec clockwork script/write_log.rb  &
  ./kibana/bin/kibana &
else
  echo "error"
fi

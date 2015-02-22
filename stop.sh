#!/bin/sh
pgrep -f 'fluentd|elasticsearch|kibana|clockwork' | xargs kill -9

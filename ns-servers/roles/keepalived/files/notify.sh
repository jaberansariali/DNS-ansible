#!/bin/bash

TYPE=$1
NAME=$2
STATE=$3

echo $3 > /var/run/keepalived.$1.$2.state

case $STATE in
  "MASTER") systemctl start dnsdist
            exit 0
            ;;
  "BACKUP") systemctl stop dnsdist
            exit 0
            ;;
  "FAULT") systemctl stop dnsdist
            exit 0
            ;;
  "*")     echo "Unknown State"
           exit 1
           ;;
esac

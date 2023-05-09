#!/bin/bash
FIREWALL_COUNT=`iptables -L|wc -l`
while true
do
  LATEST_COUNT=`iptables -L|wc -l`
  if [ $FIREWALL_COUNT -ne $LATEST_COUNT ]; then
    iptables -F ciscovpn
    iptables -F ciscovpnfinal
    iptables -F ciscovpnfw
    FIREWALL_COUNT=`iptables -L|wc -l`
  fi
  sleep 10s
done

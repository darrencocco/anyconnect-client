#!/bin/bash
while true
do
  watch -n 10  -g 'iptables -L|wc -l'
  iptables -F ciscovpn
  iptables -F ciscovpnfinal
  iptables -F ciscovpnfw
done

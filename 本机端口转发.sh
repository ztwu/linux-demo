#!/bin/bash 端口转发
iptables -t nat -A PREROUTING -p tcp --dport 9999 -j REDIRECT --to-ports 9100
service iptables save
service iptables restart

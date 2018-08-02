#!/bin/bash 端口转发
pro='tcp'
NAT_Host='172.31.17.223'
NAT_Port=9100
Dst_Host='172.31.17.2'
Dst_Port=9100
iptables -t nat -A PREROUTING  -m $pro -p $pro --dport $NAT_Port -j DNAT --to-destination $Dst_Host:$Dst_Port
iptables -t nat -A POSTROUTING -m $pro -p $pro --dport $Dst_Port -d $Dst_Host -j SNAT --to-source $NAT_Host
service iptables save
service iptables restart
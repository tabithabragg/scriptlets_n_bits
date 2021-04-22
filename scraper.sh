#!/bin/bash

subscription-manager refresh

svrname=$(hostname)
svrip=$(ip addr | grep -i "inet " | grep -v "inet 127" | awk '{print $2}')
release=$(cat /etc/redhat-release)
motd=$(cat /etc/motd | grep -i "server")
svrup=$(uptime | awk '{print $3}')
satenv=$(subscription-manager identity | grep -i environment)
satprod=$(subscription-manager list | grep -i "product name:")
satstatus=$(subscription-manager list | grep -i "status:")
yumspace=$(df -h /var)
yumuse=$(du -hs /var/cache/yum)
cnthostnme=$(subscription-manager facts | grep -i "network.hostname:")
cnthostnmeoverride=$(subscription-manager facts | grep -i "network.hostname-override:")


echo $svrname "," $cnthostnme "," $cnthostnmeoverride "," $svrip "," $release "," $motd "," $svrup "," $satenv "," $satprod "," $satstatus "," $yumspace "," $yumspace



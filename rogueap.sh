#!/bin/bash

ifconfig wlan0 down
ifconfig wlan0 10.0.0.1 netmask 255.255.255.0
ifconfig wlan0 up

echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -A FORWARD -i wlan0 -j ACCEPT
iptables -t nat -A POSTROUTING -o usb0 -j MASQUERADE

/etc/init.d/isc-dhcp-server start

/usr/sbin/hostapd -P /var/run/hostapd.pid -B /etc/rogueap/hostapd.conf

#!/bin/bash

apt-get install hostapd isc-dhcp-server dsniff sslstrip

update-rc.d isc-dhcp-server remove
update-rc.d hostapd remove

cp ./etc/dhcpd.conf /etc/dhcp/dhcpd.conf
sed -ie 's/INTERFACES=""/INTERFACES="wlan0"/g' /etc/default/isc-dhcp-server

cp rogueap.sh /usr/bin/rogueap
chmod 777 /usr/bin/rogueap

mkdir /etc/rogueap
cp ./etc/* /etc/rogueap/

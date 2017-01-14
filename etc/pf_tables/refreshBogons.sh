#!/bin/sh
DBFILE="/etc/pf_tables/fullbogons-ipv4.txt"
wget -v -O $DBFILE http://www.team-cymru.org/Services/Bogons/fullbogons-ipv4.txt
pfctl -v -t bogons -T replace -f $DBFILE


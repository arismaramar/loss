#!/bin/bash
COLOR1='\033[0;35m'
NC='\e[0m'
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC}               • GANTI DOMAIN •                 ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
read -rp "Input ur domain : " -e pp
    echo "$pp" > /etc/xray/domain
    echo $pp > /root/domain
    echo "IP=$pp" > /var/lib/sc-prem/ipvps.conf
echo "Silahkan pilih menu Gen-Cert untuk mendapatkan cert domain baru"
red "Press any key to back on menu"
menu

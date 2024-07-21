#!/bin/bash
# =========================================
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
vlx=$(grep -c -E "^#& " "/etc/xray/config.json")
let vla=$vlx/2
vmc=$(grep -c -E "^### " "/etc/xray/config.json")
let vma=$vmc/2
ssh1="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
cname=$(awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo)
freq=$(awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo)
tram=$( free -m | awk 'NR==2 {print $2}' )
uram=$( free -m | awk 'NR==2 {print $3}' )
fram=$( free -m | awk 'NR==2 {print $4}' )
MODEL=$(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')

trx=$(grep -c -E "^#! " "/etc/xray/config.json")
let tra=$trx/2
ssx=$(grep -c -E "^## " "/etc/xray/config.json")
let ssa=$ssx/2
COLOR1='\033[0;35m'
COLOR2='\033[0;34m'
clear
# // Exporting Language to UTF-8
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'
export LC_CTYPE='en_US.utf8'

# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'

# // Export Banner Status Information
export EROR="[${RED} EROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"

# // Export Align
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"

# // Root Checking
if [ "${EUID}" -ne 0 ]; then
                echo -e "${EROR} Please Run This Script As Root User !"
                exit 1
fi
tomem="$(free | awk '{print $2}' | head -2 | tail -n 1 )"
usmem="$(free | awk '{print $3}' | head -2 | tail -n 1 )"
cpu1="$(mpstat | awk '{print $4}' | head -4 |tail -n 1)"
cpu2="$(mpstat | awk '{print $6}' | head -4 |tail -n 1)"

persenmemori="$(echo "scale=2; $usmem*100/$tomem" | bc)"
#persencpu=
persencpu="$(echo "scale=2; $cpu1+$cpu2" | bc)"

# // nginx
nginx=$( systemctl status nginx | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $nginx == "running" ]]; then
    status_nginx="${GREEN}ON${NC}"
else
    status_nginx="${RED}OFF${NC}"
fi

# // SSH Websocket Proxy
xray=$(/etc/init.d/ssh status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
if [[ $xray == "running" ]]; then
    status_xray="${GREEN}ON${NC}"
else
    status_xray="${RED}OFF${NC}"
fi

# MENU VPS
MYIP=$(curl -sS ipv4.icanhazip.com)
clear
echo -e "${COLOR2}┌─────────────────────────────────────────────────┐\033[0m${NC}"
echo -e " \E[47;1;30m              INFORMATION VPS SYSTEM             \E[0m"
echo -e "${COLOR2}└─────────────────────────────────────────────────┘\033[0m${NC}"
echo -e "${YELLOW}↪${NC} Date & Time        ${YELLOW}⇒${NC} $( date -d "0 days" +"%d-%m-%Y | %X" )"
echo -e "${YELLOW}↪${NC} Os Model           ${YELLOW}⇒${NC} $MODEL"
echo -e "${YELLOW}↪${NC} Cpu Model          ${YELLOW}⇒${NC}$cname"
echo -e "${YELLOW}↪${NC} Cpu Frequency      ${YELLOW}⇒${NC}$freq MHz"
echo -e "${YELLOW}↪${NC} Domain Vps         ${YELLOW}⇒${NC} $(cat /etc/xray/domain)"
echo -e "${YELLOW}↪${NC} Ip Vps             ${YELLOW}⇒${NC} $MYIP"
echo -e "${YELLOW}↪${NC} Total Ram          ${YELLOW}⇒${NC} $tram MB"
echo -e "${YELLOW}↪${NC} Resource           ${YELLOW}⇒${NC} RAM = $persenmemori% | CPU = $persencpu%"
echo -e "$COLOR2┌─────────────────────────────────────────────────┐${NC}"
echo -e "  ${GREEN}[ SSH${NC}: ${GREEN}ON ${NC}]      [ NGINX${NC}: ${status_nginx} ]    [ XRAY${NC}: ${status_xray} ]"
echo -e "$COLOR2└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR2┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR2│  \033[0m ${BOLD}${YELLOW}SSH   VMESS   VLESS   TROJAN    SHADOWSOCKS$NC   $COLOR2│"
echo -e "$COLOR2│  \033[0m ${Blue} $ssh1      $vma       $vla       $tra            $ssa   $NC     $COLOR2│"
echo -e "$COLOR2└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR2┌─────────────────────────────────────────────────┐${NC}"
echo -e "    ${YELLOW}[1]${NC} ▸ SSH ${NC}             ${YELLOW}[8]${NC}  ▸ RUNNING${NC}"
echo -e "    ${YELLOW}[2]${NC} ▸ VMESS ${NC}           ${YELLOW}[9]${NC}  ▸ SPEEDTEST${NC}"
echo -e "    ${YELLOW}[3]${NC} ▸ VLESS ${NC}           ${YELLOW}[10]${NC} ▸ CEK BANDWIDTH${NC}"
echo -e "    ${YELLOW}[4]${NC} ▸ TROJAN ${NC}          ${YELLOW}[11]${NC} ▸ REBOOT${NC}"
echo -e "    ${YELLOW}[5]${NC} ▸ SHADOWSOCKS ${NC}     ${YELLOW}[12]${NC} ▸ RESTART SERVICE${NC}"
echo -e "    ${YELLOW}[6]${NC} ▸ ADD-HOST${NC}         ${YELLOW}[13]${NC} ▸ CLEARLOG${NC}"
echo -e "    ${YELLOW}[7]${NC} ▸ GEN-CERT${NC}         ${YELLOW}[14]${NC} ▸ INFO${NC}"
echo -e "$COLOR2└─────────────────────────────────────────────────┘${NC}"
echo -e ""
echo -e " [X] • [Press X To Exit]"
echo -e ""
echo -ne " Select menu : "; read opt
case $opt in
1) clear ; menussh ;;
2) clear ; menuv ;;
3) clear ; menul ;;
4) clear ; menut ;;
5) clear ; menus ;;
6) clear ; add-host ;;
7) clear ; genssl ;;
9) clear ; cek-speed ;;
11) clear ; jam ;;
8) clear ; running ;;
10) clear ; cek-bandwidth ;;
12) clear ; restartsc ;;
13) clear ; clearlog ;;
14) clear ; cat /root/log-install.txt ;;
0) clear ; menu ;;
x) exit ;;
*) clear ; menu ;;
esac

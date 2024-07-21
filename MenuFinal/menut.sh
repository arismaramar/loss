#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Memeriksa VPS"
clear
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White
UWhite='\033[4;37m'       # White
On_IPurple='\033[0;105m'  #
On_IRed='\033[0;101m'
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White
NC='\e[0m'

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
clear
echo ""
echo -e "${BICyan} ┌─────────────────────────────────────────────────────┐${NC}"
echo -e "       ${BIWhite}XRAY TROJAN MENU ${NC}"
echo -e ""
echo -e "     ${BICyan}[${BIWhite}1${BICyan}] Create Account XRAY Trojan Websocket "
echo -e "     ${BICyan}[${BIWhite}2${BICyan}] Extending Account XRAY Trojan Active "
echo -e "     ${BICyan}[${BIWhite}3${BICyan}] Delete Account XRAY Trojan Websocket  "
echo -e "     ${BICyan}[${BIWhite}4${BICyan}] Check User Login XRAY Trojan     "
echo -e ""
echo -e "     ${BICyan}[${BIWhite}0${BICyan}] Back To Menu     "
echo -e " ${BICyan}└─────────────────────────────────────────────────────┘${NC}"
echo -e "     ${BIYellow}Press x or [ Ctrl+C ] • To-${BIWhite}Exit${NC}"
echo ""
read -p " Select menu :  "  opt
echo -e ""
case $opt in
1) clear ; addt ;;
2) clear ; renet ;;
3) clear ; delt;;
4) clear ; cekt ;;
0) clear ; menu ;; 
x) exit ;; 
*) echo -e "Press any key to back exit" ; sleep 1 ; menut ;;
esac

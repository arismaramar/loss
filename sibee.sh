#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
# ==========================================
# Colors
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
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
# ==========================================
clear
echo -e ""
echo -e "\033[0;37m ↝ Selamat Datang Sir "
echo -e " ↝ Masukkan Kode Untuk Lanjut "
echo -e " ↝ Kode Tidak Terlihat Saat Di Ketik "
echo -e "\033[0;32m"
kunci="yyy";
read -s -p "Password 👉 " pass
if [ $pass == $kunci ]
then
clear
else
clear
echo -e ""
echo -e "${RED}Password Salah...!!${NC}"
echo -e ""
sleep 2
rm -rf sibe.sh
rm -fr sibe.sh
sleep 2
exit
fi
echo -e "\033[0;32m SELAMAT ANDA BERHASIL MASUK & INSTALL"
sleep 3
echo -e ""
echo -e "\e[33mINSTALASI AKAN DIMULAI DALAM 3 DETIK..........\033[0m"
sleep 3
localip=$(hostname -I | cut -d\  -f1)
hst=( `hostname` )
dart=$(cat /etc/hosts | grep -w `hostname` | awk '{print $2}')
if [[ "$hst" != "$dart" ]]; then
echo "$localip $(hostname)" >> /etc/hosts
fi
if [ -f "/root/log-install.txt" ]; then
rm -fr /root/log-install.txt
fi
mkdir -p /etc/xray
mkdir -p /etc/v2ray
touch /etc/xray/domain
touch /etc/v2ray/domain
touch /etc/xray/scdomain
touch /etc/v2ray/scdomain

ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
sysctl -w net.ipv6.conf.all.disable_ipv6=1 >/dev/null 2>&1
sysctl -w net.ipv6.conf.default.disable_ipv6=1 >/dev/null 2>&1

apt install git curl -y >/dev/null 2>&1
apt install python -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] GOOD ... Installation file is ready now"
sleep 2
mkdir -p /var/lib/sc-prem >/dev/null 2>&1
echo "IP=" >> /var/lib/sc-prem/ipvps.conf
wget -q https://raw.githubusercontent.com/arismaramar/loss/main/tools.sh;chmod +x tools.sh;./tools.sh
rm tools.sh
clear
echo -e "${CYAN}┌──────────────────────────────────────────┐${NC}"
echo -e "${tyblue}      Please select a domain type below                 ${NC}"
echo -e "${CYAN}└──────────────────────────────────────────┘${NC}"
echo -e "${CYAN}┌──────────────────────────────────────────┐${NC}"
echo -e "${tyblue}   [ 1 ]  Use Random Domain (recomend)           ${NC}"
echo -e "${CYAN}└──────────────────────────────────────────┘${NC}"
read -rp "    Masukkan pilihan anda  : " -e host
echo ""
if [[ $host == "1" ]]; then
wget -q https://raw.githubusercontent.com/arismaramar/loss/main/cfdomain.sh && chmod +x cfdomain.sh && ./cfdomain.sh
rm -f /root/cfdomain.sh
clear
fi
echo ""
clear
wget -q https://raw.githubusercontent.com/arismaramar/loss/main/cfnsdomain.sh && chmod +x cfnsdomain.sh && ./cfnsdomain.sh
rm -f /root/cfnsdomain.sh
clear
#install ssh ovpn
echo -e "\e[33m┌────────────────────────────────────────────────────────────┐\033[0m"
echo -e "$green              Sedang Menginstal Tunnel SSH / WS               $NC"
echo -e "\e[33m└────────────────────────────────────────────────────────────┘\033[0m"
sleep 2
wget https://raw.githubusercontent.com/arismaramar/loss/main/ssh-vpn.sh && chmod +x ssh-vpn.sh && ./ssh-vpn.sh
sleep 2
clear
wget https://raw.githubusercontent.com/arismaramar/loss/main/nginx-ssl.sh && chmod +x nginx-ssl.sh && ./nginx-ssl.sh
sleep 2
#install ssh ovpn
echo -e "\e[33m┌────────────────────────────────────────────────────────────┐\033[0m"
echo -e "$green                  Sedang Menginstal Websocket              $NC"
echo -e "\e[33m└────────────────────────────────────────────────────────────┘\033[0m"
sleep 2
wget https://raw.githubusercontent.com/arismaramar/loss/main/insshws.sh && chmod +x insshws.sh && ./insshws.sh
sleep 2
cd /usr/bin
wget -O xp "https://raw.githubusercontent.com/arismaramar/loss/main/xp.sh"
chmod +x xp
sleep 2
echo -e "${GREEN}DOWNLOAD CPU RAM...${NC}"
wget -q -O /usr/bin/notramcpu "https://raw.githubusercontent.com/arismaramar/loss/main/MenuFinal/Lain/notramcpu" && chmod +x /usr/bin/notramcpu
sleep 2
cd
rm -f /root/ins-xray.sh
rm -f /root/insshws.sh
rm -f /root/xraymode.sh
sleep 2
#xray
echo -e "${GREEN}DOWNLOAD XRAY CORE...${NC}"
wget -q -O ins-xray.sh https://raw.githubusercontent.com/arismaramar/loss/main/ins-xray.sh && chmod +x ins-xray.sh && ./ins-xray.sh
sleep 2
echo -e "${GREEN}DOWNLOAD MENU...${NC}"
wget -q -O senmenu.sh https://raw.githubusercontent.com/arismaramar/loss/main/senmenu.sh && chmod +x senmenu.sh && ./senmenu.sh
echo -e "${GREEN}DOWNLOAD DATA DONE...${NC}"
sleep 2
echo -e "${GREEN}DOWNLOAD SLOWDNS...${NC}"
wget -q -O sldns.sh https://raw.githubusercontent.com/arismaramar/loss/main/slowdns/sldns.sh && chmod +x sldns.sh && ./sldns.sh

#pemangkuvmessvless
mkdir /root/akun
mkdir /root/akun/vmess
mkdir /root/akun/vless
mkdir /root/akun/shadowsocks
mkdir /root/akun/trojan


#install remove log
echo "0 5 * * * root reboot" >> /etc/crontab
echo "* * * * * root clog" >> /etc/crontab
echo "59 * * * * root pkill 'menu'" >> /etc/crontab
echo "0 1 * * * root xp" >> /etc/crontab
echo "*/5 * * * * root notramcpu" >> /etc/crontab
service cron restart
clear
org=$(curl -s https://ipapi.co/org )
echo "$org" > /root/.isp

cat> /root/.profile << END
if [ "$BASH" ]; then
if [ -f ~/.bashrc ]; then
. ~/.bashrc
fi
fi
mesg n || true
clear
menu
END
chmod 644 /root/.profile
if [ -f "/root/log-install.txt" ]; then
rm -fr /root/log-install.txt
fi
cd
echo "1.0.0" > versi
clear
rm -f ins-xray.sh
rm -f senmenu.sh
rm -f setupxx.sh
rm -f xraymode.sh
rm -f sldns.sh
echo ""
echo "=====================-[   PREMIUM AUTOSCRIPT ]-===================="
echo ""
echo "------------------------------------------------------------"
echo ""
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                 : 22, 53, 2222, 2269"  | tee -a log-install.txt
echo "   - SSH Websocket           : 80" | tee -a log-install.txt
echo "   - SSH SSL Websocket       : 443" | tee -a log-install.txt
echo "   - Stunnel5                : 222, 777" | tee -a log-install.txt
echo "   - Dropbear                : 109, 143" | tee -a log-install.txt
echo "   - Badvpn                  : 7100-7300" | tee -a log-install.txt
echo "   - Nginx                   : 81" | tee -a log-install.txt
echo "   - XRAY  Vmess TLS         : 443" | tee -a log-install.txt
echo "   - XRAY  Vmess None TLS    : 80" | tee -a log-install.txt
echo "   - XRAY  Vless TLS         : 443" | tee -a log-install.txt
echo "   - XRAY  Vless None TLS    : 80" | tee -a log-install.txt
echo "   - Trojan GRPC             : 443" | tee -a log-install.txt
echo "   - Trojan WS               : 443" | tee -a log-install.txt
echo "   - Sodosok WS/GRPC         : 443" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - AutoKill Multi Login User" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Fully automatic script" | tee -a log-install.txt
echo "   - VPS settings" | tee -a log-install.txt
echo "------------------------------------------------------------"
sleep 10
clear
echo -e "\e[33m┌────────────────────────────────────────────────────────────┐\033[0m"
echo -e "$green      Instalasi selesai & VPS akan reboot dalam 3 detik              $NC"
echo -e "\e[33m└────────────────────────────────────────────────────────────┘\033[0m"
sleep 3
reboot

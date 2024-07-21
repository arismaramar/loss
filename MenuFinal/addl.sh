#!/bin/bash
red() { echo -e "\\033[32;1m${*}\\033[0m"; }
COLOR1='\033[0;35m'
NC='\e[0m'
clear
domain=$(cat /etc/xray/domain)
clear
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
  echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
  echo -e "$COLOR1│${NC}             • CREATE VLESS USER •              ${NC} $COLOR1│$NC"
  echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
  echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"

  read -rp "User: " -e user
  CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

  if [[ ${CLIENT_EXISTS} == '1' ]]; then
    clear
    echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e "\E[0;41;36m             VLESS ACCOUNT           \E[0m"
    echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo ""
    echo "A client with the specified name was already created, please choose another name."
    echo ""
    echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
    read -n 1 -s -r -p "Press any key to back on menu"
    menu
  fi
done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
exp=$(date -d "$masaaktif days" +"%Y-%m-%d")
sed -i '/#vless$/a\#& '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#vlessgrpc$/a\#& '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json

vlesslink1="vless://${uuid}@${domain}:443?path=/vless&security=tls&encryption=none&type=ws#${user}"
vlesslink2="vless://${uuid}@${domain}:80?path=/vless&encryption=none&type=ws#${user}"
vlesslink3="vless://${uuid}@${domain}:443?mode=gun&security=tls&encryption=none&type=grpc&serviceName=vless-grpc&sni=${domain}#${user}"
cat >/var/www/html/vless-$user.txt <<-END
END
systemctl restart xray
systemctl restart nginx
DATADB=$(cat /root/akun/vless/.vless.conf | grep "^#&" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /root/akun/vless/.vless.conf
fi
echo "#& ${user} ${exp} ${uuid}" >>/root/akun/vless/.vless.conf
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}" | tee -a /root/akun/vless/$user.txt
echo -e "                  Vip Vless Account      \E[0m" | tee -a /root/akun/vless/$user.txt
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" | tee -a /root/akun/vless/$user.txt
echo -e "Remarks          : ${user}" | tee -a /root/akun/vless/$user.txt
echo -e "Domain           : ${domain}" | tee -a /root/akun/vless/$user.txt
echo -e "port TLS/GRPC    : 443" | tee -a /root/akun/vless/$user.txt
echo -e "Port NTLS        : 80" | tee -a /root/akun/vless/$user.txt
echo -e "User ID          : ${uuid}" | tee -a /root/akun/vless/$user.txt
echo -e "Path             : /vless " | tee -a /root/akun/vless/$user.txt
echo -e "ServiceName      : vless-grpc" | tee -a /root/akun/vless/$user.txt
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" | tee -a /root/akun/vless/$user.txt
echo -e "Link TLS    : ${vlesslink1}" | tee -a /root/akun/vless/$user.txt
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" | tee -a /root/akun/vless/$user.txt
echo -e "Link NTLS   : ${vlesslink2}" | tee -a /root/akun/vless/$user.txt
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" | tee -a /root/akun/vless/$user.txt
echo -e "Link GRPC   : ${vlesslink3}" | tee -a /root/akun/vless/$user.txt
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" | tee -a /root/akun/vless/$user.txt
echo -e "Expired On : $exp" | tee -a /root/akun/vless/$user.txt
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" | tee -a /root/akun/vless/$user.txt
sleep 2
echo -e ""
echo -e "${BIBlue}  ─────────────────────────────────────────${NC}"
echo -e "${YELLOW}       PERGUNAKAN DGN BAIK  " 
echo -e "${BIBlue}  ─────────────────────────────────────────${NC}"
read -n 1 -s -r -p "Press any key to back on menu"
menu

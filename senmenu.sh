#!/bin/bash
export GREEN='\033[0;32m'
NC='\e[0m'
# // config Data
echo -e "${GREEN}DOWNLOAD FILE DATA..PLEASE WAIT...${NC}"
sleep 3
wget -q -O /usr/bin/menuv "https://raw.githubusercontent.com/arismaramar/loss/main/MenuFinal/menuv.sh"
wget -q -O /usr/bin/addv "https://raw.githubusercontent.com/arismaramar/loss/main/MenuFinal/addv.sh"
wget -q -O /usr/bin/cekv "https://raw.githubusercontent.com/arismaramar/loss/main/MenuFinal/cekv.sh"
wget -q -O /usr/bin/delv "https://raw.githubusercontent.com/arismaramar/loss/main/MenuFinal/delv.sh"
wget -q -O /usr/bin/renev "https://raw.githubusercontent.com/arismaramar/loss/main/MenuFinal/renev.sh"
wget -q -O /usr/bin/menul "https://raw.githubusercontent.com/arismaramar/loss/main/MenuFinal/menul.sh"
wget -q -O /usr/bin/addl "https://raw.githubusercontent.com/arismaramar/loss/main/MenuFinal/addl.sh"
wget -q -O /usr/bin/cekl "https://raw.githubusercontent.com/arismaramar/loss/main/MenuFinal/cekl.sh"
wget -q -O /usr/bin/dell "https://raw.githubusercontent.com/arismaramar/loss/main/MenuFinal/dell.sh"
wget -q -O /usr/bin/renel "https://raw.githubusercontent.com/arismaramar/loss/main/MenuFinal/renel.sh"
wget -q -O /usr/bin/xp "https://raw.githubusercontent.com/arismaramar/loss/main/xp.sh"
wget -q -O /usr/bin/clog "https://raw.githubusercontent.com/arismaramar/loss/main/MenuFinal/clog.sh"
wget -q -O /usr/bin/addt "https://raw.githubusercontent.com/arismaramar/loss/main/MenuFinal/addt.sh"
wget -q -O /usr/bin/cekt "https://raw.githubusercontent.com/arismaramar/loss/main/MenuFinal/cekt.sh"
wget -q -O /usr/bin/delt "https://raw.githubusercontent.com/arismaramar/loss/main/MenuFinal/delt.sh"
wget -q -O /usr/bin/renet "https://raw.githubusercontent.com/arismaramar/loss/main/MenuFinal/renet.sh"
wget -q -O /usr/bin/menut "https://raw.githubusercontent.com/arismaramar/loss/main/MenuFinal/menut.sh"
wget -q -O /usr/bin/menus "https://raw.githubusercontent.com/arismaramar/loss/main/MenuFinal/menu-ssws.sh"
wget -q -O /usr/bin/menussh "https://raw.githubusercontent.com/arismaramar/loss/main/MenuFinal/menussh.sh"
wget -q -O /usr/bin/usern "https://raw.githubusercontent.com/arismaramar/loss/main/MenuFinal/usern.sh"
wget -q -O /usr/bin/menu "https://raw.githubusercontent.com/arismaramar/loss/main/MenuFinal/menu.sh"
#xx
echo -e "${GREEN}DOWNLOAD EQUIPMENT FILE DATA..PLEASE WAIT...${NC}"
sleep 3
wget -q -O /usr/bin/add-host "https://raw.githubusercontent.com/arismaramar/loss/main/MenuFinal/Lain/add-host.sh"
wget -q -O /usr/bin/cek-bandwidth "https://raw.githubusercontent.com/arismaramar/loss/main/MenuFinal/Lain/cek-bandwidth.sh"
wget -q -O /usr/bin/clearlog "https://raw.githubusercontent.com/arismaramar/loss/main/MenuFinal/Lain/clearlog.sh"
wget -q -O /usr/bin/genssl "https://raw.githubusercontent.com/arismaramar/loss/main/MenuFinal/Lain/genssl.sh"
wget -q -O /usr/bin/restartsc "https://raw.githubusercontent.com/arismaramar/loss/main/MenuFinal/Lain/restart.sh"
wget -q -O /usr/bin/running "https://raw.githubusercontent.com/arismaramar/loss/main/MenuFinal/Lain/running.sh"
wget -q -O /usr/bin/cek-speed "https://raw.githubusercontent.com/arismaramar/loss/main/MenuFinal/Lain/speedtes_cli.py"
wget -q -O /usr/bin/cek-trafik "https://raw.githubusercontent.com/arismaramar/loss/main/MenuFinal/Lain/cek-trafik.sh"
wget -q -O /usr/bin/jam "https://raw.githubusercontent.com/arismaramar/loss/main/reboot.sh"

chmod +x /usr/bin/menuv
chmod +x /usr/bin/addv
chmod +x /usr/bin/cekv
chmod +x /usr/bin/renev
chmod +x /usr/bin/delv
chmod +x /usr/bin/menul
chmod +x /usr/bin/addl
chmod +x /usr/bin/cekl
chmod +x /usr/bin/renel
chmod +x /usr/bin/dell
chmod +x /usr/bin/xp
chmod +x /usr/bin/clog
chmod +x /usr/bin/menut
chmod +x /usr/bin/addt
chmod +x /usr/bin/cekt
chmod +x /usr/bin/renet
chmod +x /usr/bin/delt
chmod +x /usr/bin/menus
chmod +x /usr/bin/menussh
chmod +x /usr/bin/usern
chmod +x /usr/bin/menu
#lain
chmod +x /usr/bin/add-host
chmod +x /usr/bin/cek-bandwidth
chmod +x /usr/bin/clearlog
chmod +x /usr/bin/genssl
chmod +x /usr/bin/restartsc
chmod +x /usr/bin/running
chmod +x /usr/bin/cek-speed
chmod +x /usr/bin/cek-trafik
chmod +x /usr/bin/jam
echo -e "${GREEN}SETUP DATA IS DONE...${NC}"
sleep 5
cd

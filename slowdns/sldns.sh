#!/bin/bash
# Slowdns Instalation by sibeesans
# ==========================================
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
clear
red='\e[1;31m'
green='\e[0;32m'
yell='\e[1;33m'
NC='\e[0m'
echo -e "[ ${green}INFO${NC} ] Installing SSH Slow DNS "
echo -e "[ ${green}INFO${NC} ] Loading... "
sleep 1
echo -e "[ ${green}INFO${NC} ] Add files... "
nameserver=$(cat /etc/xray/nsdomain)
echo -e "[ ${green}INFO${NC} ] Loading... "
echo "Progress..."
# SSH SlowDNS
echo -e "[ ${green}INFO${NC} ] Successfully.. "
wget -qO- -O /etc/ssh/sshd_config https://raw.githubusercontent.com/arismaramar/loss/main/slowdns/sshd_config
systemctl restart sshd
sleep 1
echo -e "[ ${green}INFO${NC} ] Tambahan... "
apt install screen -y
apt install cron -y
apt install iptables -y
service cron reload
service cron restart
service iptables reload
sleep 1
echo -e "[ ${green}INFO${NC} ] Downloading files... "
cd /usr/local
wget -qc https://golang.org/dl/go1.16.2.linux-amd64.tar.gz
tar xvf go1.16.2.linux-amd64.tar.gz
export GOROOT=/usr/local/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
cd /root
apt install git -y
sleep 1
echo -e "[ ${green}INFO${NC} ] Downloading files... "
git clone https://www.bamsoftware.com/git/dnstt.git sans
mv /root/sans /root/slowdns
rm -rf sans
cd /root/slowdns/dnstt-server
go build
echo -e "[ ${green}INFO${NC} ] Install Key... "
sleep 1
./dnstt-server -gen-key -privkey-file /root/slowdns/dnstt-server/server.key -pubkey-file /root/slowdns/dnstt-server/server.pub
echo -e "[ ${green}INFO${NC} ] Successfully... "
sleep 1
mkdir -m 777 /root/.dns
sleep 2
echo -e "[ ${green}INFO${NC} ] Waiting... "
mv /root/slowdns/dnstt-server/server.key /root/.dns/server.key
mv /root/slowdns/dnstt-server/server.pub /root/.dns/server.pub
rm -rf /etc/slowdns
mkdir -m 777 /etc/slowdns
echo -e "[ ${green}INFO${NC} ] Successfully... "
sleep 1
cd /root
rm -rf slowdns
sleep 1
echo -e "[ ${green}INFO${NC} ] Downloading files... "
wget -qc -O /etc/slowdns/sldns-server "https://raw.githubusercontent.com/arismaramar/loss/main/slowdns/sldns-server"
wget -qc -O /etc/slowdns/sldns-client "https://raw.githubusercontent.com/arismaramar/loss/main/slowdns/sldns-client"
sleep 1
chmod +x /etc/slowdns/sldns-server
chmod +x /etc/slowdns/sldns-client
cd
echo -e "[ ${yell}INFO${NC} ] Successfully... "
sleep 1
wget -q -O /etc/systemd/system/client-sldns.service "https://raw.githubusercontent.com/arismaramar/loss/main/slowdns/client-sldns.service"
wget -q -O /etc/systemd/system/server-sldns.service "https://raw.githubusercontent.com/arismaramar/loss/main/slowdns/server-sldns.service"
cd
sleep 1
echo -e "[ ${yell}INFO${NC} ] System Prosess... "
sleep 2
install client-sldns.service
cat > /etc/systemd/system/client-sldns.service << END
[Unit]
Description=Client SlowDNS By sibeesans
Documentation=https://www.google.com
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/etc/slowdns/sldns-client -udp 8.8.8.8:53 --pubkey-file /root/.dns/server.pub $nameserver 127.0.0.1:3369
Restart=on-failure

[Install]
WantedBy=multi-user.target
END
cd
install server-sldns.service
cat > /etc/systemd/system/server-sldns.service << END
[Unit]
Description=Server SlowDNS By sibeesans
Documentation=https://www.google.com
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/etc/slowdns/sldns-server -udp :5300 -privkey-file /root/.dns/server.key $nameserver 127.0.0.1:2269
Restart=on-failure

[Install]
WantedBy=multi-user.target
END
cd
echo -e "[ ${green}INFO${NC} ] Successfully... "
chmod +x /etc/systemd/system/client-sldns.service
chmod +x /etc/systemd/system/server-sldns.service
pkill sldns-server
pkill sldns-client

iptables -I INPUT -p udp --dport 5300 -j ACCEPT
iptables -t nat -I PREROUTING -p udp --dport 53 -j REDIRECT --to-ports 5300
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload

systemctl daemon-reload
systemctl stop client-sldns
systemctl stop server-sldns
systemctl enable client-sldns
systemctl enable server-sldns
systemctl start client-sldns
systemctl start server-sldns
systemctl restart client-sldns
systemctl restart server-sldns
cd
sleep 1
echo -e "[ ${green}INFO${NC} ] Downloading files Success "
cd

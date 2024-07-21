#!/bin/bash
read -p "Masukan kamu 'bebas':" sub
DOMAIN=vpnpro.tech
pp=${sub}.vpnpro.tech
CF_ID=arismar.amar@gmail.com
CF_KEY=88ecae78b53455a919ccecd22bdbd0332f7c7
set -euo pipefail
IP=$(wget -qO- icanhazip.com);
echo "Updating DNS for ${pp}..."
ZONE=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAIN}&status=active" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)
RECORD=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records?name=${pp}" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)
if [[ "${#RECORD}" -le 10 ]]; then
     RECORD=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'${pp}'","content":"'${IP}'","ttl":120,"proxied":false}' | jq -r .result.id)
fi
RESULT=$(curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records/${RECORD}" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'${pp}'","content":"'${IP}'","ttl":120,"proxied":false}')
echo "$pp" > /root/scdomain
echo "$pp" > /etc/xray/scdomain
echo "$pp" > /etc/xray/domain
echo "$pp" > /etc/v2ray/domain
echo $pp > /root/domain
echo "IP=$pp" > /var/lib/sc-prem/ipvps.conf
rm -f /root/cfdomain.sh

iptables -t nat -A DOCKER -p tcp --dport 7222 -j DNAT --to-destination 172.22.0.2:7222
iptables -t nat -A DOCKER -p tcp --dport 16001 -j DNAT --to-destination 172.22.0.2:16001
iptables -t nat -A DOCKER -p tcp --dport 16002 -j DNAT --to-destination 172.22.0.2:16002


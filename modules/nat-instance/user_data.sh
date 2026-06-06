#!/bin/bash
set -eux

# Update package
apt-get update
apt-get upgrade -y

# Enable IP forwarding
cat <<EOF >/etc/sysctl.d/99-nat.conf
net.ipv4.ip_forward=1
EOF

sysctl --system

# Install iptables persistence
DEBIAN_FRONTEND=noninteractive apt-get install -y iptables-persistent

# Detect interfaces
PUBLIC_IF=$(ip route | grep default | awk '{print $5}')

# Enable NAT
iptables -t nat -A POSTROUTING -o $PUBLIC_IF -j MASQUERADE
iptables -A FORWARD -i $PUBLIC_IF -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -o $PUBLIC_IF -j ACCEPT

# Save rules
netfilter-persistent save
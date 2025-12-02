#!/bin/bash

curl -skL https://github.com/Siemens-Healthineers/K2s/raw/refs/heads/main/lib/modules/k2s/k2s.node.module/linuxnode/setup/certificate/ZScalerRootCA.crt -o /usr/local/share/ca-certificates/ZScalerRootCA.crt
update-ca-certificates

mkdir -p /etc/rancher/rke2

cat <<EOF >/etc/rancher/rke2/config.yaml
write-kubeconfig-mode: "0666"

cni: calico

disable:
  - rke2-ingress-nginx

ingress: "traefik"

disable-cloud-controller: true
EOF

set -x

chown admin /etc/rancher -R

curl -sfL https://get.rke2.io -o install-rke2.sh
chmod u+x ./install-rke2.sh
DEBUG=1 ./install-rke2.sh

systemctl enable rke2-server.service
systemctl start rke2-server

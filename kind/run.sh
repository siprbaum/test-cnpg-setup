#!/bin/bash
sudo $(which kind) delete cluster --name pg
sudo $(which kind) create cluster --name pg
sudo cp -r /root/.kube /home/admin
chown admin /home/admin/.kube -R
kubectl cluster-info --context kind-pg
kubectl get pods -A
kubectl apply --server-side -f https://raw.githubusercontent.com/cloudnative-pg/cloudnative-pg/release-1.25/releases/cnpg-1.25.0.yaml


kubectl get deployment -n cnpg-system cnpg-controller-manager

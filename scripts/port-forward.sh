#!/bin/bash
# for test

sudo iptables -t nat -D PREROUTING -p tcp --dport 7050 -j DNAT --to-destination 127.0.0.1:7050
kubectl port-forward $(kubectl get pod | grep orderer | awk '{print $1}') -n orgorderer1  7050:7050


sudo iptables -t nat -D PREROUTING -p tcp --dport 7051 -j DNAT --to-destination 127.0.0.1:7051
kubectl port-forward $(kubectl get pod | grep peer0 | awk '{print $1}') -n org1  7051:7051

sudo iptables -t nat -D PREROUTING -p tcp --dport 7053 -j DNAT --to-destination 127.0.0.1:7053
kubectl port-forward $(kubectl get pod | grep peer0 | awk '{print $1}') -n org1  7053:7053

sudo iptables -t nat -D PREROUTING -p tcp --dport 7054 -j DNAT --to-destination 127.0.0.1:7054
kubectl port-forward $(kubectl get pod | grep ca | awk '{print $1}') -n org1  7054:7054

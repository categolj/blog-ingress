#!/bin/bash

kubectl apply -f ingress-nginx/deploy/namespace.yaml
kubectl apply -f ingress-nginx/deploy/default-backend.yaml
kubectl apply -f ingress-nginx/deploy/configmap.yaml
kubectl apply -f ingress-nginx/deploy/tcp-services-configmap.yaml
kubectl apply -f ingress-nginx/deploy/udp-services-configmap.yaml
kubectl apply -f ingress-nginx/deploy/rbac.yaml
kubectl apply -f ingress-nginx/deploy/with-rbac.yaml
bosh int ingress-nginx/deploy/provider/baremetal/service-nodeport.yaml \
     -o opsfiles/configure-nodeport.yml \
     | kubectl apply -f -
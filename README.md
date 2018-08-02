
```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.16.0/deploy/mandatory.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.16.0/deploy/provider/cloud-generic.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.16.0/deploy/provider/baremetal/service-nodeport.yaml
kubectl patch -n ingress-nginx deployment nginx-ingress-controller --type='json' -p='[{"op": "replace", "path": "/spec/replicas", "value": 2 }]'
kubectl patch -n ingress-nginx deployment nginx-ingress-controller --type='json' -p='[{"op": "add", "path": "/spec/template/spec/affinity", "value": {"podAntiAffinity":{"requiredDuringSchedulingIgnoredDuringExecution":[{"labelSelector":{"matchExpressions":[{"key":"app","operator":"In","values":["ingress-nginx"]}]},"topologyKey":"kubernetes.io/hostname"}]}}}]'
```
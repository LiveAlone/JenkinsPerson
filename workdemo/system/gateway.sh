#!/bin/bash


office_k8s_api="http://kube-api-office.idc.cedu.cn:8080"
listfile=gateway.txt
#kubectl get svc -s $office_k8s_api --all-namespaces |egrep 'tst|dev' |awk '{print $1,$2,$6}' |awk -F'/' '{print $1}'|awk  '{print $3,$1,$2}' |awk -F'-' '{print $1}'|awk '{print $3"-"$2"-gw|"$1}'|sort |uniq >$listfile  
JSONPATH='{range .items[*]}{@.metadata.labels.app}|{@.metadata.namespace}|{range @.spec.containers[*]}{@.image}|{range @.ports[*]}{@.containerPort}#{end}{end}' 
kubectl get pod -s $office_k8s_api --namespace=tst -o jsonpath="$JSONPATH" |tr '#' '\n'|awk -F'|' '{print $2,$NF,$3}'|awk -F: '{print $1}' | awk -F'/' '{print $1,$NF}' |awk '{print $4"-"$1"-gw|"$2}'|sort |uniq >$listfile  


ingress(){
echo "---
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: ${context}-gw
  namespace: ${envType}
spec:
  rules:
  - host: gateway.${envType}.idc.cedu.cn
    http:
      paths:
      - path: /${context}
        backend:
          serviceName: ${context}
          servicePort: $ContainerPort
"
}

for i in `cat $listfile`
do
  context=`echo $i|awk -F'-' '{print $1}'`
  envType=`echo $i|awk -F'-' '{print $2}'`
  ContainerPort=`echo $i|awk -F'|' '{print $2}'`
  #ingress 
  ingress | kubectl -s $office_k8s_api create -f - 
  #ingress | kubectl -s $office_k8s_api delete -f -
done

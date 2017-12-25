#!/bin/bash

nfsinfo="
nfs-download 100Gi /data1/static/download
nfs-static 500Gi /data1/static/static
nfs-bipush 5Gi /data1/bipush
nfs-collector 15Gi /data1/collector
nfs-image  1Ti /data1/static/imgs
nfs-market 2Gi /data1/static/market
nfs-oppush 2Gi /data1/oppush
nfs-livestatic 20Gi /data1/static/livestatic
"

envtype="dev tst pre prd"
office_k8s_api="http://kube-api-office.idc.cedu.cn:8080"
online_k8s_api="http://kube-api-online.idc.cedu.cn:8080"


aa(){
echo "---
apiVersion: v1
kind: PersistentVolume
metadata:
  name: $1-$4
  labels:
    demo: $1-$4
spec:
  capacity:
    storage: $2
  accessModes:
    - ReadWriteMany
  nfs:
    server: nfs.idc.cedu.cn
    path: \"$3\"
---
kind: PersistentVolumeClaim
apiVersion: v1
metadata:
  name: $1-$4
  namespace: $4
  labels:
    demo: $1-$4
  annotations:
    volume.beta.kubernetes.io/storage-class: \"\"
spec:
  accessModes:
    - ReadWriteMany
  resources:
    requests:
      storage: $2
"
}

OLDIFS=$IFS
IFS=$'\n'

for i in ${nfsinfo}
do
 IFS=" "
 for x in ${envtype}
   do
      if [ $x = "pre" -o $x = "prd" ];then
	    aa $i $x | kubectl  -s $online_k8s_api create -f - 
	  else
	    aa $i $x | kubectl  -s $office_k8s_api create -f - 
      fi
   done
done

IFS=$OLDIFS
#!/bin/bash

envtype="dev tst pre prd"
office_k8s_api="http://kube-api-office.idc.cedu.cn:8080"
online_k8s_api="http://kube-api-online.idc.cedu.cn:8080"

#4369 5671 5672 15672 25672
aa(){
echo "---
apiVersion: v1
kind: Service
metadata:
  name: rabbitmq
  namespace: $ns
spec:
  type: ClusterIP
  clusterIP: None
  ports:
  - port: 15672
    targetPort: 15672
    protocol: TCP
    name: http
  selector:
    load-balancer-rabbitmq-${ns}: \"true\"

---
apiVersion: v1
kind: Pod
metadata:
  labels:
    app: rabbitmq
  name: rabbitmq
  namespace: $ns
  ownerReferences:
  - apiVersion: v1
    controller: true
    kind: ReplicationController
    name: rabbitmq
spec:
  containers:
  - image: docker.idc.cedu.cn/qingqing/rabbitmq:3.6.10
    imagePullPolicy: Always
    livenessProbe:
      failureThreshold: 5
      httpGet:
        path: /
        port: 15672
        scheme: HTTP
      initialDelaySeconds: 60
      periodSeconds: 10
      successThreshold: 1
      timeoutSeconds: 5
    name: rabbitmq
    readinessProbe:
      failureThreshold: 3
      httpGet:
        path: /
        port: 15672
        scheme: HTTP
      initialDelaySeconds: 30
      periodSeconds: 10
      successThreshold: 1
      timeoutSeconds: 5
    resources:
      requests:
        cpu: 80m
        memory: 1000Mi
    terminationMessagePath: /dev/termination-log
  dnsPolicy: ClusterFirst
  restartPolicy: Always
  securityContext: {}
  terminationGracePeriodSeconds: 30
"
}

for ns in ${envtype}
do
   if [ $ns = "pre" -o $ns = "prd" ];then
      aa $ns | kubectl  -s $online_k8s_api create -f - 
   else
      aa $ns | kubectl  -s $office_k8s_api create -f - 
   fi
done


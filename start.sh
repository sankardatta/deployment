#!/bin/bash

start_stop=$1
deploy_name=$2

if [$start_stop = "start" ]; then
    minikube start
    kubectl config use-context minikube

    kubectl run $deploy_name --image=sankardatt/deployment:p1 --port=8888
    echo "DEPLOYMENTS"
    kubectl get deployments


    echo "PODS"
    kubectl get pods

    kubectl expose deployment $deploy_name --type=LoadBalancer
    echo "SERVICES"
    kubectl get services

    minikube service $deploy_name



elif [$start_stop = "stop" ]; then

    kubectl delete service $deploy_name 
    kubectl delete deployment $deploy_name 
    minikube stop

else
    echo "Start Or Stop?"
fi

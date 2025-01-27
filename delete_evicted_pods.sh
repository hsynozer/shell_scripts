#! /bin/bash
evpods=$(kubectl get pods --all-namespaces | grep -i evicted | awk '{ print $2 }')

for i in $evpods; do
    kubectl delete pods "${i}"
done

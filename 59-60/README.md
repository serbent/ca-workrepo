`kubectl -n kube-system get pod kube-controller-manager -o yaml`

edit the yaml to add this to the list of commands:

`--horizontal-pod-autoscaler-sync-period`
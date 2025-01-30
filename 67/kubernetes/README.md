# LOKI

`helm repo add grafana https://grafana.github.io/helm-charts`
`helm repo update`
`helm upgrade --install loki --namespace=loki-stack grafana/loki-stack --values loki-stack-values.yaml --create-namespace`
`helm upgrade --install grafana-agent --namespace=loki grafana/grafana-agent --values grafana-agent-values.yaml`
`kubectl port-forward svc/loki-grafana 3000:80 -n loki-stack`
`kubectl get secret loki-grafana -n loki-stack -o jsonpath="{.data.admin-password}" | base64 --decode ; echo`

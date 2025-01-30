# LOKI

`helm repo add grafana https://grafana.github.io/helm-charts`
`helm repo update`
`helm upgrade --install loki --namespace=loki-stack grafana/loki-stack --values loki-stack-values.yaml --create-namespace`

```shell
cd terraform
terraform init
terraform apply
export KUBECONFIG=./kubeconfig.yml
cd ..
```

```shell
helm upgrade --install argo-cd helm/charts/argo-cd \
--create-namespace --namespace argo-cd
```
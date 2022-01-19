```shell
export TF_VAR_token=[...]
export KUBECONFIG=./terraform/kubeconfig.yml
```


```shell
terraform -chdir=./terraform init
terraform -chdir=./terraform plan
terraform -chdir=./terraform apply
```

```shell
helm upgrade --install argo-cd helm/charts/argo-cd \
--create-namespace --namespace argocd
```

```shell
terraform -chdir=./terraform destroy
```
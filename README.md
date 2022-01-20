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
--create-namespace --namespace toolkit
```
```shell
kubectl apply -f helm/root.yaml 
```

```shell
kubectl get secret argocd-initial-admin-secret \
--namespace toolkit \
--output jsonpath="{.data.password}" \
| base64 -d

kubectl port-forward svc/argo-cd-argocd-server 8080:443 -n toolkit

open http://127.0.0.1:8080
```

```shell
terraform -chdir=./terraform destroy
```
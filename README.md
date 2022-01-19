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
kubectl apply -f helm/root.yaml 
```
```shell
kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 -d
kubectl port-forward svc/argo-cd-argocd-server 8080:443 -n argocd
```

```shell
terraform -chdir=./terraform destroy
```
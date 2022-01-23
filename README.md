# tlnguyen.com infrastructure code

## Manual steps for provisioning/destroying the Linode Kubernetes cluster
### Prerequisites
- terraform cli - https://learn.hashicorp.com/tutorials/terraform/install-cli
- kubectl cli - https://kubernetes.io/docs/tasks/tools/
- helm cli - https://helm.sh/docs/intro/install/
- kubeseal cli - https://github.com/bitnami-labs/sealed-secrets#homebrew

### Env Vars
```shell
export TF_VAR_token=put_your_linode_token_here
export KUBECONFIG=./terraform/kubeconfig.yml
```
### Create cluster
```shell
terraform -chdir=./terraform init
terraform -chdir=./terraform plan
terraform -chdir=./terraform apply
```
### Install ArgoCD
```shell
helm upgrade --install argo-cd helm/charts/argo-cd \
--create-namespace --namespace argocd
```
### Install App for Apps in ArgoCD
```shell 
kubectl apply -f helm/root.yaml 
```
### Destroy cluster
```shell
terraform -chdir=./terraform destroy
```
---
## Useful commands
### ArgoCD login password and port forwarding
```shell
kubectl get secret argocd-initial-admin-secret \
--namespace argocd \
--output jsonpath="{.data.password}" \
| base64 -d

kubectl port-forward svc/argo-cd-argocd-server 8080:443 \
--namespace argocd

open http://127.0.0.1:8080
```
### Traefik dashboard port forwarding
```shell
kubectl port-forward $(kubectl get pods --selector "app.kubernetes.io/name=traefik" --output=name) 9000:9000

open http://127.0.0.1:9000/dashboard/#/
```
### Example for Generating a Sealed Secret resource
```shell
kubectl --namespace argocd create secret generic linode-token \
--dry-run=client \
--from-literal linode_api_token=$TF_VAR_token \
--output yaml \
| kubeseal \
--controller-name=sealed-secrets \
--controller-namespace=argocd \
-o yaml \
| tee sealedsecret-linode-token.yaml
```
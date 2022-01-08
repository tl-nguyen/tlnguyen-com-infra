resource "local_file" "kubeconfig" {
  depends_on = [linode_lke_cluster.lke_cluster]
  filename   = "kubeconfig.yml"
  content    = base64decode(linode_lke_cluster.lke_cluster.kubeconfig)
}
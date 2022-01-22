resource "linode_lke_cluster" "lke_cluster" {
  label       = "tlnguyen.com"
  k8s_version = "1.22"
  region      = "eu-west"
  tags        = ["prod"]

  pool {
    type  = "g6-standard-2"
    count = 1

    autoscaler {
      min = 1
      max = 3
    }
  }
}
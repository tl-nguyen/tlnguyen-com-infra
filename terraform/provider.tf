provider "linode" {
  token = var.token
}

terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "1.24.0"
    }
  }
}
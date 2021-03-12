terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "2.0.3"
    }
  }
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "nginx_ingress" {
  name       = "nginx-ingress"
  repository = "https://helm.nginx.com/stable"
  chart      = "nginx-ingress"
  version    = "0.8.0"
  namespace  = "kube-system"

  values = [
    file("helm/nginx-ingress/values.yml")
  ]
}


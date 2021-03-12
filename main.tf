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
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "nginx-ingress"
  version    = "3.24.0"
  namespace  = "kube-system"

  values = [
    file("helm/nginx-ingress/values.yml")
  ]
}


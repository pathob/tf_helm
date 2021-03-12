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
  name      = "nginx-ingress"
  chart     = "https://github.com/kubernetes/ingress-nginx/releases/download/helm-chart-3.24.0/ingress-nginx-3.24.0.tgz"
  namespace = "kube-system"

  values = [
    file("helm/nginx-ingress/values.yml")
  ]
}


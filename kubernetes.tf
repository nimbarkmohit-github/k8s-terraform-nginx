terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
  }
}

provider "kubernetes" {
  config_path = "/var/snap/microk8s/2264/credentials/client.config"
}

resource "kubernetes_namespace" "terra-kube" {
  metadata {
    name = "terra-k8s-nginx"
  }
}

resource "kubernetes_deployment" "terra-kube" {
  metadata {
    name = "terra-k8s-scalable-nginx"
    namespace = kubernetes_namespace.terra-kube.metadata.0.name
    labels = {
      app = "TerraK8SScalableNginx"
    }
  }

  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "TerraK8SScalableNginx"
      }
    }
    template {
      metadata {
        labels = {
          app = "TerraK8SScalableNginx"
        }
      }
      spec {
        container {
          image = "nginx:1.7.8"
          name  = "terra-k8s-scalable-nginx-container"
          port {
            container_port = 80
          }

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "terra-kube" {
  metadata {
    name      = "terra-k8s-scalable-nginx-svc"
    namespace = kubernetes_namespace.terra-kube.metadata.0.name
  }
  spec {
    selector = {
      app = kubernetes_deployment.terra-kube.spec.0.template.0.metadata.0.labels.app
    }
    type = "NodePort"
    port {
      node_port   = 30201
      port        = 80
      target_port = 80
    }
  }
}
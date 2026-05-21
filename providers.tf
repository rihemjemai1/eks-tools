terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.32.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "2.17.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }

    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.19.0"
    }
  }

  required_version = ">= 1.14.0"
}

provider "aws" {
  region = "us-east-1"
}

data "aws_eks_cluster" "eks_cluster" {
  name = var.cluster_name
}

data "aws_eks_cluster_auth" "eks_cluster_auth" {
  name = var.cluster_name
}

provider "kubernetes" {
  host                   = local.kube_host
  cluster_ca_certificate = local.kube_cluster_ca_certificate
  token                  = local.token
}

provider "kubectl" {
  host                   = local.kube_host
  cluster_ca_certificate = local.kube_cluster_ca_certificate
  token                  = local.token

  load_config_file = false
}

provider "helm" {
  kubernetes {
    host                   = local.kube_host
    cluster_ca_certificate = local.kube_cluster_ca_certificate
    token                  = local.token
  }
}
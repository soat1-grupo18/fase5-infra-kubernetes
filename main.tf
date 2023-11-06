terraform {
  backend "s3" {
    bucket         = "289389227463-terraform-backend"
    key            = "github/soat1-grupo18/fase3-infra-kubernetes"
    dynamodb_table = "289389227463-terraform-backend"
    region         = "sa-east-1"
  }
}

provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      terraform = "true"
    }
  }
}

provider "helm" {
  kubernetes {
    host                   = aws_eks_cluster.this.endpoint
    cluster_ca_certificate = base64decode(aws_eks_cluster.this.certificate_authority[0].data)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", var.eks_cluster_name]
      command     = "aws"
    }
  }
}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

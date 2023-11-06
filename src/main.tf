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
  alias = "fiap-cluster"
  kubernetes {
    host                   = aws_eks_cluster.this.endpoint
    cluster_ca_certificate = base64decode(aws_eks_cluster.this.certificate_authority[0].data)
    # token                  = data.aws_eks_cluster_auth.this.token
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", aws_eks_cluster.this.name]
      command     = "aws"
    }
  }
}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

resource "aws_eks_cluster" "this" {
  name     = var.eks_cluster_name
  version  = "1.28"
  role_arn = aws_iam_role.eks_cluster_role.arn

  enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]

  vpc_config {
    subnet_ids              = module.vpc.private_subnets
    endpoint_private_access = true
    endpoint_public_access  = true
  }

  access_config {
    authentication_mode                         = "API_AND_CONFIG_MAP"
    bootstrap_cluster_creator_admin_permissions = true
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_cloudwatch_log_group.eks_cluster,
    aws_iam_role_policy_attachment.eks_cluster_role_amazon_eks_cluster_policy,
    aws_iam_role_policy_attachment.eks_cluster_role_amazon_eks_vpc_resource_controller,
  ]
}

data "aws_eks_cluster_auth" "this" {
  name = aws_eks_cluster.this.name
}

resource "aws_eks_access_entry" "sysadm" {
  cluster_name  = aws_eks_cluster.this.name
  principal_arn = "arn:aws:iam::289389227463:user/og-fiap-soat"
}

resource "aws_eks_access_policy_association" "sysadm" {
  cluster_name  = aws_eks_cluster.this.name
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
  principal_arn = "arn:aws:iam::289389227463:user/og-fiap-soat"

  access_scope {
    type = "cluster"
  }
}

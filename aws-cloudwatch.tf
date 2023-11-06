resource "aws_cloudwatch_log_group" "eks_cluster" {
  # The log group name format is /aws/eks/<cluster-name>/cluster
  # Reference: https://docs.aws.amazon.com/eks/latest/userguide/control-plane-logs.html
  name              = "/aws/eks/${var.eks_cluster_name}/cluster"
  retention_in_days = 30
}

resource "aws_cloudwatch_log_group" "api_gateway" {
  name              = "API-Gateway-Execution-Logs_${aws_api_gateway_rest_api.this.id}/latest"
  retention_in_days = 30
}

variable "environment" { type = string }
variable "vpc_id" { type = string }
variable "private_subnets" { type = list(string) }

resource "aws_eks_cluster" "this" {
  name     = "${var.environment}-eks"
  role_arn = var.eks_cluster_role_arn
  vpc_config {
    subnet_ids = var.private_subnets
  }
  tags = {
    Environment = var.environment
  }
} 
variable "node_group_role_arn" { type = string }
variable "private_subnets" { type = list(string) }

resource "aws_eks_node_group" "this" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = "${var.environment}-node-group"
  node_role_arn   = var.node_group_role_arn
  subnet_ids      = var.private_subnets
  scaling_config {
    desired_size = var.node_desired_size
    max_size     = var.node_max_size
    min_size     = var.node_min_size
  }
  instance_types = var.node_instance_types
  tags = {
    Environment = var.environment
  }
} 
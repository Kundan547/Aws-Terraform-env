output "cluster_name" {
  value = aws_eks_cluster.this.name
}

output "endpoint" {
  value = aws_eks_cluster.this.endpoint
}

output "node_group_role_arn" {
  value = aws_eks_node_group.this.node_role_arn
} 
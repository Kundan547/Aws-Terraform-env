output "eks_cluster_role_arn" {
  value = aws_iam_role.eks_cluster.arn
}

output "autoscaling_role_arn" {
  value = aws_iam_role.autoscaling.arn
}

output "ecr_role_arn" {
  value = aws_iam_role.ecr.arn
}

output "alb_sg_id" {
  value = aws_security_group.alb.id
}

output "eks_sg_id" {
  value = aws_security_group.eks.id
} 
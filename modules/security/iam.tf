variable "environment" { type = string }

resource "aws_iam_role" "eks_cluster" {
  name = "${var.environment}-eks-cluster-role"
  assume_role_policy = data.aws_iam_policy_document.eks_assume_role.json
  tags = {
    Environment = var.environment
  }
}

data "aws_iam_policy_document" "eks_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "eks_cluster_AmazonEKSClusterPolicy" {
  role       = aws_iam_role.eks_cluster.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_role" "autoscaling" {
  name = "${var.environment}-autoscaling-role"
  assume_role_policy = data.aws_iam_policy_document.autoscaling_assume_role.json
  tags = {
    Environment = var.environment
  }
}

data "aws_iam_policy_document" "autoscaling_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "autoscaling_AmazonEC2AutoScalingFullAccess" {
  role       = aws_iam_role.autoscaling.name
  policy_arn = "arn:aws:iam::aws:policy/AutoScalingFullAccess"
}

resource "aws_iam_role" "ecr" {
  name = "${var.environment}-ecr-role"
  assume_role_policy = data.aws_iam_policy_document.ecr_assume_role.json
  tags = {
    Environment = var.environment
  }
}

data "aws_iam_policy_document" "ecr_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ecr.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "ecr_AmazonEC2ContainerRegistryFullAccess" {
  role       = aws_iam_role.ecr.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
} 
variable "environment" { type = string }
variable "vpc_id" { type = string }
variable "subnet_id" { type = string }
variable "ami_id" { type = string }
variable "instance_type" { type = string }
variable "security_group_ids" { type = list(string) }

resource "aws_launch_template" "this" {
  name_prefix   = "${var.environment}-lt-"
  image_id      = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = var.security_group_ids
  tag_specifications {
    resource_type = "instance"
    tags = {
      Environment = var.environment
    }
  }
}

resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  tags = {
    Environment = var.environment
  }
} 
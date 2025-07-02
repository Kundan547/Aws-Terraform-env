variable "environment" { type = string }
variable "launch_template_id" { type = string }
variable "subnet_ids" { type = list(string) }
variable "min_size" { type = number }
variable "max_size" { type = number }
variable "desired_capacity" { type = number }

resource "aws_autoscaling_group" "this" {
  name                      = "${var.environment}-asg"
  max_size                  = var.max_size
  min_size                  = var.min_size
  desired_capacity          = var.desired_capacity
  vpc_zone_identifier       = var.subnet_ids
  launch_template {
    id      = var.launch_template_id
    version = "$Latest"
  }
  tag {
    key                 = "Environment"
    value               = var.environment
    propagate_at_launch = true
  }
} 
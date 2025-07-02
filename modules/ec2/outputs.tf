output "instance_id" {
  value = aws_instance.this.id
}

output "launch_template_id" {
  value = aws_launch_template.this.id
} 
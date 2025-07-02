variable "environment" {
  description = "Environment name (dev, prod, etc.)"
  type        = string
}

variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

// Add more variables as needed for module inputs 
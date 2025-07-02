terraform {
  backend "s3" {
    bucket         = "my-terraform-state-dev"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "my-terraform-locks-dev"
    encrypt        = true
  }
} 
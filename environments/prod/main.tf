// Main entry for prod environment

module "network" {
  source = "../../modules/network"
  environment = var.environment
  // ... other network variables
}

module "security" {
  source = "../../modules/security"
  environment = var.environment
  vpc_id = module.network.vpc_id
  // ... other security variables
}

module "alb" {
  source = "../../modules/alb"
  environment = var.environment
  vpc_id = module.network.vpc_id
  public_subnets = module.network.public_subnets
  // ... other alb variables
}

module "ec2" {
  source = "../../modules/ec2"
  environment = var.environment
  vpc_id = module.network.vpc_id
  // ... other ec2 variables
}

module "autoscaling" {
  source = "../../modules/autoscaling"
  environment = var.environment
  vpc_id = module.network.vpc_id
  // ... other autoscaling variables
}

module "eks" {
  source = "../../modules/eks"
  environment = var.environment
  vpc_id = module.network.vpc_id
  private_subnets = module.network.private_subnets
  // ... other eks variables
}

module "ecr" {
  source = "../../modules/ecr"
  environment = var.environment
  // ... other ecr variables
} 
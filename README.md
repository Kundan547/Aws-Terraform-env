# AWS Multi-Environment Terraform Infrastructure

This project provides a production-ready, modular, and reusable Terraform setup for AWS, supporting multiple environments (dev, prod) with best practices for security, scalability, and maintainability.

## Structure

```
multi-env/
├── environments/
│   ├── dev/
│   │   ├── main.tf               # Calls all modules
│   │   ├── variables.tf
│   │   ├── backend.tf
│   │   └── outputs.tf
│   └── prod/
│       ├── main.tf
│       ├── variables.tf
│       ├── backend.tf
│       └── outputs.tf
├── modules/
│   ├── network/                  # VPC, public/private subnets, IGW, NAT
│   │   ├── main.tf
│   │   └── outputs.tf
│   ├── security/                # IAM roles, policies, security groups
│   │   ├── iam.tf
│   │   ├── sg.tf
│   │   └── outputs.tf
│   ├── alb/                     # ALB + Listener + Target Group
│   │   ├── alb.tf
│   │   └── outputs.tf
│   ├── ec2/                     # Launch template and instance setup
│   │   ├── main.tf
│   │   └── outputs.tf
│   ├── autoscaling/             # EC2 Auto Scaling Group
│   │   ├── main.tf
│   │   └── outputs.tf
│   ├── eks/                     # EKS cluster, managed node groups, IRSA
│   │   ├── cluster.tf
│   │   ├── node_group.tf
│   │   ├── cluster_autoscaler.tf
│   │   ├── iam.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   └── ecr/                     # AWS ECR Repository
│       ├── main.tf
│       └── outputs.tf
```

## Features
- **Multi-environment**: Isolated dev and prod environments.
- **Modular**: Reusable modules for network, security, compute, EKS, ECR, etc.
- **Remote State**: S3 and DynamoDB for state locking.
- **Best Practices**: Tagging, variable usage, IAM least privilege, outputs.
- **EKS**: Cluster, managed node groups, IRSA, HPA, Cluster Autoscaler.
- **ECR**: Repository for Docker images.
- **Security**: IAM roles/policies for EKS, autoscaling, ECR.

## Usage

1. **Clone the repository**
2. **Configure AWS credentials** (e.g., via environment variables or AWS CLI)
3. **Initialize backend**
   - Edit `backend.tf` in your environment (dev/prod) to set your S3 bucket and DynamoDB table.
4. **Set variables**
   - Edit `variables.tf` or use `terraform.tfvars` for environment-specific values.
5. **Deploy**
   ```sh
   cd multi-env/environments/dev   # or prod
   terraform init
   terraform plan
   terraform apply
   ```

## Module Overview
- **network**: VPC, subnets, IGW, NAT
- **security**: IAM roles, policies, security groups
- **alb**: Application Load Balancer, listeners, target groups
- **ec2**: Launch templates, EC2 instances
- **autoscaling**: Auto Scaling Groups
- **eks**: EKS cluster, node groups, IRSA, autoscaler
- **ecr**: ECR repository

## Notes
- Ensure your AWS account has permissions to create all resources.
- Tagging is enforced for all resources.
- IAM roles are scoped for least privilege.
- EKS supports HPA and Cluster Autoscaler out of the box.

---

For detailed module usage, see comments in each module's `variables.tf` and `outputs.tf`. 
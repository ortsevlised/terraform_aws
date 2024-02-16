# Terraform AWS Deployment

This repository contains Terraform configurations to deploy an AWS infrastructure including a Virtual Private Cloud (VPC), subnets, an EC2 instance, and Nginx configuration.

## Task 1: Create a VPC and Subnets

Using Terraform, an AWS Virtual Private Cloud (VPC) is created with the following specifications:
- VPC CIDR Block: `10.0.0.0/16`
- Two public subnets within the VPC.
- Two private subnets within the VPC.

## Task 2: Create an EC2 Instance

An AWS EC2 instance is provisioned within one of the public subnets with the following characteristics:
- Instance Type: `t2.micro`
- Amazon Machine Image (AMI): An appropriate Amazon Linux 2 AMI is chosen.
- Security Group: A security group allowing incoming traffic on ports 22 (SSH) and 80 (HTTP) is created and associated with the EC2 instance.
- Key Pair: An SSH key pair is used for instance authentication.

## Task 3: Configure Nginx

Upon instance creation, a script (Shell or User Data script) is used to install and configure Nginx on the EC2 instance. Nginx is started and set to automatically start on boot.

## Task 4: Security Group Rules

The security group associated with the EC2 instance is modified to allow incoming traffic on port 80 (HTTP) from `0.0.0.0/0` (anywhere) to make the Nginx web server accessible over the internet.

## Task 5: GitHub Actions Pipeline

A GitHub Actions pipeline is created to automate the Terraform deployment process. The pipeline:
- Triggers on pushes to the repository.
- Authenticates with AWS using GitHub Secrets for security.
- Runs `terraform init`, `terraform plan`, and `terraform apply` within the pipeline.
- Includes appropriate error handling and notifications.

For detailed implementation, refer to the Terraform configuration files and GitHub Actions workflow in this repository.

Feel free to reach out if you have any questions or suggestions!

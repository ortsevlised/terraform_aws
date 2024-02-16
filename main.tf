module "vpc" {
  source     = "./modules/vpc"
  cidr_block = "10.0.0.0/16"
  vpc_name   = "My VPC"
}

module "security_group" {
  source       = "./modules/security_groups"
  vpc_id       = module.vpc.vpc_id
  name         = "allow_web_ssh"
  description  = "Allow Web inbound traffic and SSH"
  egress_rules = [
    {
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow all outbound traffic"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
    }
  ]
  ingress_rules = [
    {
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow HTTP access from anywhere"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
    }, {
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow SSH access from anywhere"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
    }
  ]
}

module "subnet" {
  source      = "./modules/subnet"
  vpc_id      = module.vpc.vpc_id
  internet_gw = module.vpc.internet_gw
}

resource "aws_instance" "nginx" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = module.subnet.public_subnet
  vpc_security_group_ids = [module.security_group.security_group_id]
  key_name               = "terraform_key"
  user_data              = file("nginx.sh")

  tags = {
    Name = "Nginx Web Server"
  }
}

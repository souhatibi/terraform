terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "eu-west-3"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0c95ddc49a2ac351f"
  instance_type = "t2.micro"

  tags = {
    Name = "app-server-instance"
  }
}

# resource "aws_security_group" "server_sg" {
#   name        = "server-sg"
#   description = "Allow HTTP and HTTPS inbound traffic"
#   vpc_id      = aws_vpc.main.id

#   ingress {
#     from_port        = 80
#     to_port          = 80
#     protocol         = "tcp"
#     cidr_blocks      = [aws_vpc.main.cidr_block]
#   }

#   ingress {
#     from_port        = 443
#     to_port          = 443
#     protocol         = "tcp"
#     cidr_blocks      = [aws_vpc.main.cidr_block]
#   }
# }

resource "aws_security_group" "server_sg" {
  name        = "server-sg"
  description = "Allow HTTP and HTTPS inbound traffic"
  vpc_id      = aws_vpc.main.id

  dynamic "ingress" {
    for_each = toset(var.ports)

    content {
      from_port        = ingress.key
      to_port          = ingress.key
      protocol         = "tcp"
      cidr_blocks      = [aws_vpc.main.cidr_block]
    }
  }
}
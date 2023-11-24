terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0.0"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "eu-west-3"
}

resource "aws_instance" "app_server" {
  count         = var.instance_number
  ami           = var.ami #"ami-0c95ddc49a2ac351f"
  instance_type = var.instance_type #"t2.micro"

  tags = {
    Name = var.instance_name #"app-server-instance"
  }
}
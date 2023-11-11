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

resource "aws_instance" "app_server" {
  for_each      = toset([
    "t2.micro",
    "t2.medium"
  ])
  ami           = "ami-0c95ddc49a2ac351f"
  instance_type = each.key

  tags = {
    Name = "app-server-instance"
  }
}

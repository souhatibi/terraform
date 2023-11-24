module "servers" {
    source = "../modules/ec2"
    instance_number = var.instance_number
    ami = var.ami #"ami-0c95ddc49a2ac351f"
    instance_type = var.instance_type #"t2.micro"
    instance_name = format("app-server-%s-instance", var.env) #"app-server-%s-instance"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = format("main-%s", var.env)
  cidr = "10.0.0.0/16"

  azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  tags = {
    Name = format("main-%s", var.env)
    Environment = var.env
  }
}
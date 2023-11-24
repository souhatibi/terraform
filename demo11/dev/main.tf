module "servers" {
    source = "../modules/ec2"
    instance_number = var.instance_number
    ami = var.ami #"ami-0c95ddc49a2ac351f"
    instance_type = var.instance_type #"t2.micro"
    instance_name = format("app-server-%s-instance", var.env) #"app-server-%s-instance"
}
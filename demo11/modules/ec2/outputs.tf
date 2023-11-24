output "instances_ids" {
    description = "IDs of ec2 instances"
    value = aws_instance.app_server[*].id
}
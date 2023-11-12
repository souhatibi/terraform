output "instances_id" {
    value = aws_instance.app_server[*].id # equivalent to [for server in aws_instance.app_server : server.id]
}
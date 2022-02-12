output "flask_vm_public_ip" {
  value = aws_instance.flask_host.public_ip
}

output "mysql_vm_public_ip" {
  value = aws_instance.mysql_server.public_ip
}

output "flask_instance_id" {
  value = aws_instance.flask_host.id
}
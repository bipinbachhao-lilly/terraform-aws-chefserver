output "id" {
  value = aws_instance.ChefServerInstance.id
}

output "public_ipv4_address" {
  value = aws_instance.ChefServerInstance.public_ip
}

output "public_ipv4_dns" {
  value = aws_instance.ChefServerInstance.public_dns
}

output "ssh_username" {
  value = replace(var.platform, "/ubuntu-.*/", "ubuntu") == "ubuntu" ? "ubuntu" : "ec2-user"
}

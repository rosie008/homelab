output "public_ip" {
  value = aws_instance.nat-instance.public_ip
}

output "private_ip" {
  value = aws_instance.nat-instance.private_ip
}


output "network_interface_id" {
  value = aws_instance.nat-instance.primary_network_interface_id
}
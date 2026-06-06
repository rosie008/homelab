output "nat_instance_sg_id" {
  value = aws_security_group.nat_instance_sg.id
}


output "k3s_sg_id" {
  value = aws_security_group.k3s_sg.id
}

output "iam_instance_profile" {
  value = aws_iam_instance_profile.homelab_ssm_profile.name
}
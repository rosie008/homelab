resource "aws_security_group" "nat_instance_sg" {
  name        = "${var.project_name}-nat-instance-sg"
  description = "NAT Instance Security Group"
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.project_name}-nat-instance-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_vpc" {
  security_group_id = aws_security_group.nat_instance_sg.id

  cidr_ipv4   = var.vpc_cidr
  ip_protocol = "-1"
}

resource "aws_vpc_security_group_egress_rule" "allow_internet" {
  security_group_id = aws_security_group.nat_instance_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}
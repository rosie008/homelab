output "vpc_id" {
  value = aws_vpc.main-vpc.id
}

output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "private_subnet_id" {
  value = aws_subnet.private.id
}

output "private_subnet_cidr" {
  value = aws_subnet.private.cidr_block
}

output "vpc_cidr_block" {
  value = aws_vpc.main-vpc.cidr_block
  
}
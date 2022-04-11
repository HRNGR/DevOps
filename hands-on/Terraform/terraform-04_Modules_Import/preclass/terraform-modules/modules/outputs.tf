output "vpc_id" {
  value       = aws_vpc.module_vpc.id
  description = "VPC id number"
}

output "vpc_cidr" {
  value       = aws_vpc.module_vpc.cidr_block
  description = "VPC cidr block"
}

output "public_subnet_cidr" {
  value       = aws_subnet.public_subnet.cidr_block
  description = "The Public cidr block"
}

output "private_subnet_cidr" {
  value       = aws_subnet.private_subnet.cidr_block
  description = "The private cidr block"
}
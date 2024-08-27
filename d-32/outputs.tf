output "vpc_id" {
  value = aws_vpc.bhavik_vpc.id
}

output "public_subnets" {
  value = [aws_subnet.public_subnet_a.id, aws_subnet.public_subnet_b.id]
}

output "private_subnets" {
  value = [aws_subnet.private_subnet_a.id, aws_subnet.private_subnet_b.id]
}

output "db_instance_endpoint" {
  value = aws_db_instance.bhavik_rds.endpoint
}

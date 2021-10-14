output vpc_id {
  value       = aws_vpc.my_vpc.id
  description = "VPC ID"
}

output subnet_id-a {
  value       = aws_subnet.my_subnet.id
  description = "Subnet a"
}

output subnet_id-b {
  value       = aws_subnet.my_subnet_b.id
  description = "Subnet b"
}

output subnet_id-c {
  value       = aws_subnet.my_subnet_c.id
  description = "Subnet c"
}

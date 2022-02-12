output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "subnet_ids" { 
  value = [for subnet in aws_subnet.public_subnet : subnet.id]
#   value=[aws_subnet.public_subnet.*.id] 
}
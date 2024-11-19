output "vpc_id" {
  description = "ID da VPC criada"
  value       = aws_vpc.main.id
}

output "vpc_cidr" {
  description = "CIDR block da VPC"
  value       = aws_vpc.main.cidr_block
}

output "public_subnet_ids" {
  description = "IDs das subnets públicas"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "IDs das subnets privadas"
  value       = aws_subnet.private[*].id
}

output "internet_gateway_id" {
  description = "ID do Internet Gateway"
  value       = aws_internet_gateway.main.id
}

output "public_route_table_id" {
  description = "ID da route table pública"
  value       = aws_route_table.public.id
}

output "private_route_table_id" {
  description = "ID da route table privada"
  value       = aws_route_table.private.id
}

output "nat_gateway_ids" {
  description = "IDs dos NAT Gateways"
  value       = aws_nat_gateway.main[*].id
}

output "nat_gateway_ips" {
  description = "IPs Elásticos dos NAT Gateways"
  value       = aws_eip.nat[*].public_ip
}

output "public_security_group_id" {
  description = "ID do Security Group público"
  value       = aws_security_group.public.id
}

output "private_security_group_id" {
  description = "ID do Security Group privado"
  value       = aws_security_group.private.id
}

# Load Balancer Outputs
output "alb_dns_name" {
  description = "DNS name do Application Load Balancer"
  value       = aws_lb.main.dns_name
}

output "alb_target_group_arn" {
  description = "ARN do Target Group"
  value       = aws_lb_target_group.main.arn
}

# Auto Scaling Group Outputs
output "asg_name" {
  description = "Nome do Auto Scaling Group"
  value       = aws_autoscaling_group.main.name
}

output "launch_template_id" {
  description = "ID do Launch Template"
  value       = aws_launch_template.main.id
}

# RDS Outputs
output "rds_endpoint" {
  description = "Endpoint do RDS"
  value       = aws_db_instance.main.endpoint
}

output "rds_db_name" {
  description = "Nome do banco de dados RDS"
  value       = aws_db_instance.main.db_name
}

# ElastiCache Outputs
output "elasticache_endpoint" {
  description = "Endpoint do ElastiCache"
  value       = aws_elasticache_cluster.main.cache_nodes[0].address
}

output "elasticache_port" {
  description = "Porta do ElastiCache"
  value       = aws_elasticache_cluster.main.port
}

# S3 Bucket Outputs
output "s3_bucket_name" {
  description = "Nome do bucket S3"
  value       = aws_s3_bucket.main.id
}

output "s3_bucket_arn" {
  description = "ARN do bucket S3"
  value       = aws_s3_bucket.main.arn
}

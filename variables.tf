variable "aws_region" {
  description = "Região AWS onde os recursos serão criados"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Nome do projeto"
  type        = string
  default     = "meu-projeto"
}

variable "vpc_cidr" {
  description = "CIDR block para a VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks para as subnets públicas"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks para as subnets privadas"
  type        = list(string)
  default     = ["10.0.10.0/24", "10.0.11.0/24"]
}

variable "azs" {
  description = "Zonas de disponibilidade"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

# Variáveis para EC2
variable "instance_type" {
  description = "Tipo de instância EC2"
  type        = string
  default     = "t3.micro"
}

# Variáveis para RDS
variable "db_instance_class" {
  description = "Classe da instância RDS"
  type        = string
  default     = "db.t3.micro"
}

variable "db_name" {
  description = "Nome do banco de dados"
  type        = string
  default     = "myappdb"
}

variable "db_username" {
  description = "Nome do usuário do banco de dados"
  type        = string
  default     = "dbadmin"
}

# Variáveis para Elastic Cache
variable "elasticache_node_type" {
  description = "Tipo de nó do ElastiCache"
  type        = string
  default     = "cache.t3.micro"
}

variable "elasticache_num_cache_nodes" {
  description = "Número de nós do ElastiCache"
  type        = number
  default     = 1
}

# Variáveis para S3
variable "s3_bucket_name" {
  description = "Nome do bucket S3"
  type        = string
  default     = "my-app-bucket"
}

# Variáveis para Load Balancer
variable "alb_name" {
  description = "Nome do Application Load Balancer"
  type        = string
  default     = "my-app-alb"
}

# Variáveis para Auto Scaling
variable "asg_min_size" {
  description = "Tamanho mínimo do Auto Scaling Group"
  type        = number
  default     = 1
}

variable "asg_max_size" {
  description = "Tamanho máximo do Auto Scaling Group"
  type        = number
  default     = 3
}

variable "asg_desired_capacity" {
  description = "Capacidade desejada do Auto Scaling Group"
  type        = number
  default     = 2
}

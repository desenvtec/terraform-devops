# Projeto Terraform - Infraestrutura AWS

Este é um projeto de Infraestrutura como Código (IaC) utilizando Terraform para criar uma infraestrutura completa na AWS.

## Recursos Criados

### Rede
- **VPC**: VPC dedicada com DNS habilitado
- **Subnets Públicas**: 2 subnets (uma em cada AZ) com auto-assign de IP público
- **Subnets Privadas**: 2 subnets (uma em cada AZ) para recursos internos
- **Internet Gateway**: Para acesso à internet das subnets públicas
- **NAT Gateways**: Um NAT Gateway em cada subnet pública para permitir acesso à internet das subnets privadas
- **Route Tables**: 
  - Route Table Pública: Roteia tráfego para internet via Internet Gateway
  - Route Table Privada: Roteia tráfego para internet via NAT Gateway

### Segurança
- **Security Group Público**:
  - Entrada: HTTP (80), HTTPS (443), SSH (22)
  - Saída: Todo tráfego permitido
- **Security Group Privado**:
  - Entrada: Todo tráfego do Security Group público
  - Saída: Todo tráfego permitido

### Computação e Escalabilidade
- **Application Load Balancer (ALB)**:
  - Balanceador de carga público
  - Health checks configurados
  - Listener na porta 80 (HTTP)
- **Auto Scaling Group (ASG)**:
  - Configuração de mínimo, máximo e capacidade desejada
  - Distribuído entre zonas de disponibilidade
  - Launch Template com Amazon Linux 2
- **Launch Template**:
  - Configuração de instância EC2
  - User data para instalação do Apache
  - Configuração de rede e segurança

### Banco de Dados
- **RDS (MySQL)**:
  - Engine MySQL 8.0
  - Multi-AZ para alta disponibilidade
  - Subnet group dedicado
  - Backup automático
- **ElastiCache (Redis)**:
  - Engine Redis 6.x
  - Subnet group dedicado
  - Configuração de segurança

### Armazenamento
- **S3 Bucket**:
  - Versionamento habilitado
  - Criptografia AES-256
  - Bloqueio de acesso público
  - Políticas de segurança

## Estrutura do Projeto

```
.
├── main.tf           # Configuração principal dos recursos
├── variables.tf      # Definição de variáveis
├── outputs.tf        # Outputs dos recursos criados
└── terraform.tfvars  # Valores das variáveis (criar se necessário)
```

## Pré-requisitos

- Terraform instalado (versão recomendada: >= 1.0.0)
- Credenciais AWS configuradas
- AWS CLI instalado e configurado

## Como usar

1. Clone o repositório:
```bash
git clone [URL_DO_REPOSITORIO]
cd [NOME_DO_DIRETORIO]
```

2. (Opcional) Crie um arquivo `terraform.tfvars` para personalizar as variáveis:
```hcl
project_name = "meu-projeto"
aws_region = "us-east-1"
vpc_cidr = "10.0.0.0/16"
instance_type = "t3.micro"
db_instance_class = "db.t3.micro"
```

3. Inicialize o Terraform:
```bash
terraform init
```

4. Verifique o plano de execução:
```bash
terraform plan
```

5. Aplique as mudanças:
```bash
terraform apply
```

6. Para destruir a infraestrutura:
```bash
terraform destroy
```

## Variáveis Disponíveis

| Nome | Descrição | Padrão |
|------|-----------|--------|
| aws_region | Região AWS | us-east-1 |
| project_name | Nome do projeto | meu-projeto |
| vpc_cidr | CIDR da VPC | 10.0.0.0/16 |
| public_subnet_cidrs | CIDRs das subnets públicas | ["10.0.1.0/24", "10.0.2.0/24"] |
| private_subnet_cidrs | CIDRs das subnets privadas | ["10.0.10.0/24", "10.0.11.0/24"] |
| azs | Zonas de disponibilidade | ["us-east-1a", "us-east-1b"] |
| instance_type | Tipo de instância EC2 | t3.micro |
| db_instance_class | Classe da instância RDS | db.t3.micro |
| db_name | Nome do banco de dados | myappdb |
| elasticache_node_type | Tipo de nó do ElastiCache | cache.t3.micro |
| s3_bucket_name | Nome do bucket S3 | my-app-bucket |
| asg_min_size | Tamanho mínimo do ASG | 1 |
| asg_max_size | Tamanho máximo do ASG | 3 |
| asg_desired_capacity | Capacidade desejada do ASG | 2 |

## Outputs

O projeto fornece diversos outputs úteis, incluindo:
- IDs da VPC e Subnets
- IDs dos NAT Gateways e seus IPs Elásticos
- IDs dos Security Groups
- DNS name do Load Balancer
- Endpoint do RDS
- Endpoint do ElastiCache
- Nome e ARN do bucket S3
- Nome do Auto Scaling Group

## Considerações de Segurança

- As subnets públicas só devem conter recursos que precisam de acesso direto à internet
- As subnets privadas são mais seguras para recursos internos
- O Security Group privado só aceita tráfego do Security Group público
- Considere restringir o acesso SSH (porta 22) para IPs específicos em produção
- O RDS e ElastiCache estão nas subnets privadas para maior segurança
- O S3 bucket tem bloqueio de acesso público e criptografia habilitada
- Recomendado usar AWS Secrets Manager para senhas do RDS

## Monitoramento e Manutenção

- Configure CloudWatch Alarms para monitorar recursos
- Implemente logs de aplicação no CloudWatch Logs
- Mantenha as AMIs e patches de segurança atualizados
- Revise e atualize as políticas de segurança regularmente
- Faça backup regular dos dados do RDS e S3

# Projeto Terraform

Este é um projeto de Infraestrutura como Código (IaC) utilizando Terraform.

## Estrutura do Projeto

```
.
├── main.tf           # Configuração principal do Terraform
├── variables.tf      # Definição de variáveis
├── outputs.tf        # Definição de outputs
└── terraform.tfvars  # Valores das variáveis
```

## Pré-requisitos

- Terraform instalado (versão recomendada: >= 1.0.0)
- Credenciais configuradas do provedor de cloud escolhido

## Como usar

1. Inicialize o Terraform:
```bash
terraform init
```

2. Verifique o plano de execução:
```bash
terraform plan
```

3. Aplique as mudanças:
```bash
terraform apply
```

4. Para destruir a infraestrutura:
```bash
terraform destroy
```

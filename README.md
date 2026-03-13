# GCP Automated Infrastructure with Terraform & GitHub Actions

[![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![GCP](https://img.shields.io/badge/GoogleCloud-%234285F4.svg?style=for-the-badge&logo=google-cloud&logoColor=white)](https://cloud.google.com/)
[![GitHub Actions](https://img.shields.io/badge/github%20actions-%232671E5.svg?style=for-the-badge&logo=githubactions&logoColor=white)](https://github.com/features/actions)

Este repositório contém a implementação de uma infraestrutura escalável e segura no **Google Cloud Platform (GCP)**, utilizando **Terraform** para provisionamento e **GitHub Actions** para automação de CI/CD.

## Objetivo do Projeto
O foco principal é demonstrar padrões de **SRE e Engenharia de Infraestrutura**, como o uso de identidades federadas (Keyless Auth), gerenciamento de estado remoto e segurança de rede (VPC/NAT).

---

## Arquitetura da Solução

A infraestrutura provisionada inclui:
* **Google Compute Engine:** Instâncias configuradas via código.
* **Virtual Private Cloud (VPC):** Redes customizadas com regras de firewall restritivas.
* **Cloud NAT:** Permite que instâncias privadas acessem a internet sem exposição a IPs públicos.
* **GCS Backend:** Armazenamento do `terraform.tfstate` com versionamento e proteção contra deleção.

### Segurança (Keyless Authentication)
Este projeto **não utiliza chaves JSON estáticas** de Service Accounts. Em vez disso, implementamos o **Workload Identity Federation**:
1. O GitHub Actions solicita um token OIDC.
2. O GCP valida a identidade do repositório.
3. Um token temporário de curto prazo é gerado para a execução do workflow.

---

## 📂 Estrutura de Arquivos
```bash
├── .github/workflows
│   └── deploy.yml        # Pipeline de automação (Plan/Apply)
├── main.tf               # Definição de Provedores e Recursos Core
├── variables.tf          # Variáveis de entrada (Project ID, Region, etc)
├── outputs.tf            # Informações críticas expostas pós-deploy
├── terraform.tfvars      # (Exemplo) Valores das variáveis
└── backend.tf            # Configuração do Bucket GCS para o State

# Azure Terraform Infrastructure Project

## Overview

This repository contains Infrastructure as Code (IaC) written in **Terraform** to provision Azure resources using a modular architecture.

The project demonstrates how to deploy Azure infrastructure by following Terraform best practices with reusable modules.

---

## Project Features

- Azure Resource Group
- Virtual Network (VNet)
- Subnets
- Network Security Group (NSG)
- Public IP Address
- Network Interface (NIC)
- Linux Virtual Machine
- Windows Virtual Machine
- Azure Bastion Host
- Azure Load Balancer
- Azure Application Gateway
- Azure Key Vault
- Modular Terraform Architecture
- Environment-based Deployment

---

## Project Structure

```
Terraform-Project
│
├── environment
│   └── dev
│       ├── main.tf
│       ├── provider.tf
│       ├── variable.tf
│       ├── terraform.tfvars
│
├── module
│   ├── azurerm_resource_group
│   ├── azurerm_virtual_network
│   ├── azurerm_subnet
│   ├── azurerm_network_security_group
│   ├── azurerm_public_ip
│   ├── azurerm_network_interface
│   ├── azurerm_linux_virtual_machine
│   ├── azurerm_windows_virtual_machine
│   ├── azurerm_lb
│   ├── azurerm_application_gateway
│   ├── azurerm_bastion_host
│   └── azurerm_key_vault
│
├── .gitignore
├── LICENSE
└── README.md
```

---

## Prerequisites

Before deploying the infrastructure, install:

- Terraform (v1.x)
- Azure CLI
- Git
- Visual Studio Code
- Active Azure Subscription

---

## Deployment Steps

### 1. Clone the Repository

```bash
git clone https://github.com/virendrakumar25-art/Terraform-Project.git
```

### 2. Navigate to Environment

```bash
cd Terraform-Project/environment/dev
```

### 3. Initialize Terraform

```bash
terraform init
```

### 4. Validate Configuration

```bash
terraform validate
```

### 5. Review Execution Plan

```bash
terraform plan
```

### 6. Deploy Infrastructure

```bash
terraform apply
```

### 7. Destroy Infrastructure

```bash
terraform destroy
```

---

## Technologies Used

- Terraform
- Microsoft Azure
- Azure CLI
- Git
- GitHub
- Infrastructure as Code (IaC)

---

## Learning Objectives

This project helped me practice:

- Terraform Modules
- Azure Networking
- Azure Virtual Machines
- Bastion Host Deployment
- Load Balancer
- Application Gateway
- Azure Key Vault
- Variables and Outputs
- Modular Infrastructure Design
- Infrastructure Automation

---

## Best Practices Followed

- Modular Terraform Code
- Reusable Modules
- Version Controlled Infrastructure
- Sensitive Files Excluded using `.gitignore`
- Clean Project Structure

---

## Future Enhancements

- Azure DevOps Pipeline
- GitHub Actions CI/CD
- Checkov Security Scan
- Trivy Scan
- TFLint
- tfsec
- Infracost
- Azure Monitor
- Azure Landing Zone

---

## Author

**Virendra Kumar**

Senior Azure DevSecOps Engineer

### Skills

Azure • Terraform • Azure DevOps • GitHub • CI/CD • Infrastructure as Code • DevSecOps

GitHub:
https://github.com/virendrakumar25-art

---

## License

This project is licensed under the MIT License.

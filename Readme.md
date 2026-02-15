# 🚀 RealFinal - Cloud-Native DevOps Project

This project demonstrates a complete DevOps lifecycle implementation, moving from code to production-style infrastructure using modern cloud-native tools and practices.

## 🌟 Features

- **Infrastructure as Code (IaC)**: Fully automated AWS infrastructure provisioning using **Terraform**.
- **Kubernetes Orchestration**: Amazon **EKS** cluster management with **Helm** charts.
- **CI/CD Pipelines**: Modular **Azure DevOps** pipelines for Infrastructure, Addons, and Application Release.
- **GitOps Delivery**: Automated application syncing and configuration management using **ArgoCD**.
- **Security & Identity**: 
  - **AWS Cognito** for secure user authentication.
  - **HashiCorp Vault** for secret management and injection.
- **Quality Assurance**: Automated code quality and security scans with **SonarQube**.
- **Observability**: Application monitoring and visibility.
- **Networking**: Ingress management with **Nginx Ingress Controller** and AWS **ALB/NLB**.

## 🏗️ Architecture Stack

| Component | Tool | Description |
|-----------|------|-------------|
| **Cloud Provider** | AWS | Hosting environment (EKS, VPC, etc.) |
| **IaC** | Terraform | Infrastructure provisioning |
| **Orchestration** | Kubernetes (EKS) | Container orchestration |
| **CI/CD** | Azure DevOps | Build and release pipelines |
| **GitOps** | ArgoCD | Continuous Deployment |
| **Secrets** | HashiCorp Vault | Secrets management |
| **Auth** | AWS Cognito | IAM and User Pools |
| **Quality** | SonarQube | Code quality & security |
| **Containerization** | Docker | Application containerization |
| **Ingress** | Nginx | Ingress controller |

## 📂 Project Structure

```
├── infrastructure-pipeline.yml  # Pipeline for provisioning AWS resources
├── addons-pipeline.yml          # Pipeline for installing Helm charts (Vault, Argo, etc.)
├── release-pipeline.yml         # Pipeline for building and pushing app Docker image
├── motivational-app/            # Source code and Helm chart for the Python application
├── terraform/                   # Terraform configuration files (.tf)
└── README.md                    # Project documentation
```

## 🚀 Getting Started

### Prerequisites

- **Azure DevOps** account
- **AWS** account with appropriate permissions
- **Terraform** installed
- **kubectl** and **Heĺm** installed

### Deployment Flow

1. **Infrastructure Pipeline**: 
   - Provisions VPC, EKS Cluster, Cognito User Pools, and API Gateway using Terraform.
   - Outputs critical infrastructure IDs for subsequent steps.

2. **Addons Pipeline**:
   - Deploys essential cluster addons: Nginx Ingress, Vault, ArgoCD, and SonarQube.
   - Configures integrations between services (e.g., API Gateway $\rightarrow$ NLB).

3. **Release Pipeline**:
   - Builds the Python application Docker image.
   - Pushes the image to the container registry.

4. **ArgoCD Sync**:
   - Detects changes in the Helm chart/Git repository.
   - Automatically syncs the new application version to the EKS cluster.

## 🤝 Acknowledgements

Special thanks to **Eng. Omar Higgy** for the mentorship and guidance throughout this journey, fostering a mindset of "learning by doing, breaking, fixing, and improving".

---


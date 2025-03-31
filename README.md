# Azure Container Apps - CI/CD with Terraform and GitHub Actions

## Overview
Azure Container Apps is a fully managed serverless platform that simplifies deployment, scaling, and management of containerized applications without the need to manage the underlying infrastructure. This project demonstrates a structured CI/CD workflow leveraging GitHub Actions, Docker, and Terraform, deploying secure, scalable containerized applications across distinct development stages (dev, stage, prod).

## Project Structure

```
├── Dockerbuild/          # Docker files and ACR setup
├── environments/         # Terraform envs (dev, stage, prod)
├── modules/
│   ├── container_app/    # Container App infra module
│   └── private_network/  # VNet and subnet infra module
└── README.md


```


## CICD stages-

```

Jobs:
├── build
│
├── DeploymentStageDEV (needs: build)
│
├── DeploymentStageSTAGE (needs: DeploymentStageDEV)
│
└── DeploymentStagePROD (needs: DeploymentStageSTAGE)

Dev ➡️ Stage ➡️ Prod

```
 ContainerApps Diagram

 ![Azure Container Apps Architecture](diagrams/ME_dev-env_mews-dev-rg_westeurope.svg)




Dedicated Vnet lB and ip for dev

<p align="center">
  <img src="diagrams/mews-dev-rg.svg" width="800">
</p>




storageaccount.yaml This pipeline to create Azure Resource Group and Storage Account to storr state files using AZ command line. (workflow nmae - Create Storage Accounts)
cicd.yaml This Pipeline has (Workflow Name - Mews App Build and Deployment Workflow)
          CI - ACR and dicker image build and push to ACR after creation in Build stage
          CD - Deployment to Dev,Stage,and Prod

### Terraform Modules

- **container_app**: Defines Azure Container Apps, Container App Environments, User Assigned Managed Identity, Log Analytics, and ACR integration.
- **private_network**: Configures Azure Virtual Network (VNet) and Subnet with delegation to Azure Container Apps.

## Continuous Integration (CI)

### Azure Container Registry (ACR)
Terraform is used to provision Azure Container Registry (ACR) environments for dev, stage, and prod.

Docker images are built from the provided Dockerfile in the `build` directory and pushed to ACR through GitHub Actions workflows.

### GitHub Actions Workflow (CI)
- Initializes Terraform and provisions ACR.
- Builds Docker image tagged with commit SHA.
- Pushes Docker image to both Azure Container Registry and Docker Hub.

## Continuous Deployment (CD)

### Infrastructure Deployment
Terraform scripts provision Azure infrastructure, including:

- Virtual Network (VNet) and delegated Subnet.
- Azure Container App Environments linked to VNets.
- Container Apps pulling Docker images from ACR.
- User-defined Managed Identity with AcrPull role assignment for secure image pulling.

### Secure Networking
Integration of Container Apps with a dedicated VNet and Subnet ensures secure and controlled ingress/egress traffic. Azure automatically provisions a Managed Load Balancer and Public IP within a managed resource group, following a naming convention:

## 🌐 Azure VNet and Subnet CIDR Ranges

| Environment | VNet CIDR        | Subnet CIDR       |
|-------------|------------------|-------------------|
| `dev`       | `10.1.0.0/16`    | `10.1.0.0/23`     |
| `stage`     | `10.2.0.0/16`    | `10.2.0.0/23`     |
| `prod`      | `10.3.0.0/16`    | `10.3.0.0/23`     |


```
ME_<container-app-env-name>_<your-resource-group-name>_<region>
```

For example:
```
ME_dev-env_mews-dev-rg_westeurope
```

### GitHub Actions Workflow (CD)
- Initializes Terraform environment for dev, stage, and prod.
- Deploys infrastructure based on the provided Docker image.
- Verifies application deployment by checking the availability of the deployed app.

## Workload Profile: Consumption
By default, Azure Container Apps uses the Consumption workload profile:

- **Dynamic scaling** based on CPU, memory, or HTTP traffic.
- **Pay-as-you-go**, billed for actual usage, not reserved capacity.
- **Autoscaling** capability, scaling down to zero instances when idle.

Explicitly defining this profile clearly communicates scaling intentions.

## Managed Identity
User-defined Managed Identity is used for authenticating Azure Container Apps to securely pull images from ACR with the AcrPull role. This enhances security by avoiding the use of hardcoded credentials.

## Prerequisites
- Azure Subscription
- Azure CLI
- Terraform CLI
- GitHub Actions configured in the repository
- Azure AD Service Principal with `Contributor` and `User Access Administrator` roles

### Azure AD Service Principal

```bash
az ad sp create-for-rbac --name github-terraform

az role assignment create \
  --assignee "<SP_CLIENT_ID>" \
  --role "Contributor" \
  --scope "/subscriptions/<SUBSCRIPTION_ID>"

az role assignment create \
  --assignee "<SP_CLIENT_ID>" \
  --role "User Access Administrator" \
  --scope "/subscriptions/<SUBSCRIPTION_ID>"
```

Store Service Principal credentials securely in GitHub repository secrets (`AZURE_CREDENTIALS`).

## Storage Account for Terraform State
Before running Terraform workflows, ensure a dedicated storage account and container are created to store Terraform state files securely. This storage should be provisioned separately and its details provided in Terraform backend configurations (`backend.tf`).

## Execution

### Terraform Initialization

```bash
terraform init
```

### Terraform Plan and Apply

```bash
terraform plan -var="image_tag=<GITHUB_SHA>" -out=tfplan
terraform apply tfplan
```

### Terraform Destroy

```bash
terraform destroy -var="image_tag=<GITHUB_SHA>"
```

## Validation
Post-deployment validation is automatically performed via curl commands in the GitHub Actions workflow to ensure the container app is reachable and healthy.

---

This structured CI/CD approach ensures streamlined and secure deployments of your Azure Container Apps across multiple environments, leveraging infrastructure as code and GitHub Actions for full automation.Please refer documenatation atatched it.


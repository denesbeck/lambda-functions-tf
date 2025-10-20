# lambda-functions-tf

Terraform configurations for the `lambda-functions` automation tool, managed remotely through [HCP Terraform](https://www.hashicorp.com/cloud/terraform).

---

## 📋 Overview

This project provisions and manages infrastructure for the [`lambda-functions`](https://github.com/denesbeck/lambda-functions) automation tool.

Infrastructure is deployed to **AWS**.

---

## 🏗️ Architecture Components

| Service                   | Purpose                               |
| ------------------------- | ------------------------------------- |
| **S3**                    | Lambda functions, layers and hashes   |
| **Lambda**                | Handler functions                     |
| **Event Bridge**          | Automated Lambda layer cleanup        |
| **Terraform Cloud (HCP)** | Remote backend for state and workflow |

---

## 🔧 Prerequisites

- **Terraform CLI**: Installed on your local machine ([download](https://www.terraform.io/downloads))
- **HCP Terraform Account**: Set up with an associated workspace for this repo
- **AWS Account & IAM Permissions**
- **Terraform CLI Authentication to HCP**: via `terraform login`

---

## 🚀 Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/denesbeck/lambda-functions-tf.git
cd lambda-functions-tf
```

### 2. Log in to HCP Terraform

```bash
terraform login
```

This authenticates your CLI with Terraform Cloud for remote state and run operations.

### 3. Initialize the Workspace

```bash
terraform init
```

This will automatically detect and configure the remote backend specified in `providers.tf`.

### 4. Plan & Apply (via CLI and HCP UI)

You can preview changes locally with:

```bash
terraform plan
```

You can apply changes by pushing them to the default branch (usually `main`) to trigger a run via VCS integration.

---

## 📂 Repository Structure

- `modules/core/`:
  - `lambda.tf` – Lambda handler functions
  - `s3.tf` – S3 buckets for storing metadata
  - `scheduler.tf` – Automated Lambda layer cleanup
- `modules/iam/`: IAM roles and policies for resources
  - `scheduler.tf` - IAM role and trust policy for the EventBridge Scheduler
  - `layer-cleanup.tf` - IAM role and policy for the layer cleanup automation
  - `oidc.tf` - IAM resources for the GH OIDC
- `modules/iam/apps/`: Application specific IAM roles and policies

---

## ☁️ Terraform Cloud Backend

This project uses the following remote backend configuration (found in `providers.tf`):

```hcl
terraform {
  cloud {
    organization = "crimson-org"

    workspaces {
      name = "lambda-functions-tf"
    }
  }
}
```

---

## 📌 Notes

- Terraform state is stored and versioned in HCP Terraform.
- You can manage plans, runs, and approvals through the [Terraform Cloud UI](https://app.terraform.io).

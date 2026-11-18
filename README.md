# Infrastructure as Code (IaC) Practice

A curated collection of hands-on Infrastructure as Code (IaC) practice problems, templates, and solutions built with **Terraform** and **AWS CloudFormation**. 

This repository serves as a reference guide and learning log for provisioning, managing, and automating cloud resources.

---

## Tech Stack & Tools

* **Terraform** (HCL)
* **AWS CloudFormation** (YAML / JSON)
* **Cloud Provider:** Amazon Web Services (AWS)

---

## Quick Start / How to Run

### Running Terraform Code
1. Navigate to the desired exercise folder:
   ```bash
   cd terraform/01-ec2-instance
   ```
2. Initialize the working directory:
   ```bash
   terraform init
   ```
3. Preview the execution plan:
   ```bash
   terraform plan
   ```
4. Apply the configuration:
   ```bash
   terraform apply
   ```
5. Destroy resources when done to avoid cloud charges:
   ```bash
   terraform destroy
   ```

### Deploying CloudFormation Templates
1. Navigate to the desired exercise folder:
   ```bash
   cd cloudformation/01-ec2-stack
   ```
2. Deploy the stack via AWS CLI:
   ```bash
   aws cloudformation deploy \
     --template-file template.yaml \
     --stack-name my-practice-stack \
     --capabilities CAPABILITY_IAM
   ```
3. Delete the stack when finished:
   ```bash
   aws cloudformation delete-stack --stack-name my-practice-stack
   ```

---

##  Disclaimer
All templates and configurations in this repository are created for educational and practice purposes. Always review security group rules, IAM permissions, and potential AWS costs before deploying into a production environment.

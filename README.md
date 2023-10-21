# AWS Cloud Technical Essentials - Terraform Code

This repository contains the Terraform code developed during the "AWS Cloud Technical Essentials" course on Coursera. While the original course did not utilize Terraform, I chose to implement the AWS infrastructure using this for more efficient and reproducible management.

The implementation is highly configurable, with most settings abstracted into variables to provide flexibility and adaptability.

## Prerequisites

1. [Terraform](https://www.terraform.io/downloads.html) installed.
2. An [AWS](https://aws.amazon.com/) account set up.
3. [AWS CLI](https://aws.amazon.com/cli/) installed and configured.

## Configuration

All configurable parameters are defined in variables. A sample `terraform.tfvars.example` file is provided to showcase available variables. To use, rename the file to `terraform.tfvars` and replace the example values with your actual values.

## Deployment

1. Clone the repository:
   ```bash
   git clone git@github.com:amartineztoledo/coursera_aws_essentials.git
   cd coursera_aws_essentials
2. Initialize the Terraform directory:
    ```bash
    terraform init
3. Validate the Terraform configuration:
    ```bash
    terraform plan
4. Apply the configuration
    ```bash
    terraform apply
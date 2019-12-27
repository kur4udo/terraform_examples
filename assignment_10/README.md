# Exercise 10 - Workspaces

In this exercise we will use Terraform workspaces to seperate code deployed in different regions.

First, we modify code to be more flexible:

1. In variables.tf file:
    - comment default value of region,
    - remove variable availability_zones.
2. In main.tf:
    - add aws_availability_zones data,
    - modify availability_zones in module "compute" to use aws_availability_zones names attribute.

Now we can play with workspaces. We will use backend, from previous exercise, to keep states. Run terraform workspace for available options.

1. Run terraform init,
2. Create 3 workspaces:
    - dev,
    - test,
    - prod.
3. Switch to each workspace and apply code:
    - on dev use eu-west-1 region,
    - on test use eu-west-2 region,
    - on prod use eu-central-1 region.
4. In AWS console check if state files were created in S3 bucket, for example:
    - env:/dev/terraform-training/terraform.tfstate,
    - env:/test/terraform-training/terraform.tfstate,
    - env:/prod/terraform-training/terraform.tfstate.

In the end, destroy all built infrastructure.

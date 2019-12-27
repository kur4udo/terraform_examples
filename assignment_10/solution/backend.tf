# Exercise 10 - Workspaces
# main.tf

terraform {
    backend "s3" {
    bucket = "tf-training-backend-example"
    key = "terraform-training/terraform.tfstate"
    region = "eu-west-1"
  }
}
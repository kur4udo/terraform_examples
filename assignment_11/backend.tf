# Exercise 11 - Route 53
# main.tf

terraform {
    backend "s3" {
    bucket = "tf-training-backend-example"
    key = "terraform-training/terraform.tfstate"
    region = "eu-west-1"
  }
}
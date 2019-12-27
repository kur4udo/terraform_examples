# Exercise 9 - Backend
# main.tf

provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "backend" {
    bucket = "tf-training-backend-example"
    region = var.region
}
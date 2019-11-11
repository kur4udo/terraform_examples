# Exercise 4.1 - Variables - example solution
# main.tf

# Provider

provider "aws" {
  region = var.region
}

# Resource

resource "aws_s3_bucket" "bucket_1" {
  bucket = var.bucket_name
}

# Variable

variable region {
  description = "Enter AWS region:"
  default = "eu-west-1"
}

variable bucket_name {
  description = "Bucket name:"
}


# Exercise 4.3 - outputs
# main.tf

# Provider

provider "aws" {
  region = var.region
}

# Resources

resource "aws_s3_bucket" "bucket_1" {
  bucket = var.bucket_names[0]
  region = var.region
}

resource "aws_s3_bucket" "bucket_2" {
  bucket = var.bucket_names[1]
  region = var.region
}

resource "aws_s3_bucket" "bucket_3" {
  bucket = var.bucket_names[2]
  region = var.region
}

# List

variable bucket_names {
  description = "List with bucket names"
  type = list(string)
  default = [
    "test-bucket-1",
    "test-bucket-2",
    "test-bucket-3"
  ]
}

# Variable

variable region {
  description = "Enter region:"
  type = string
  default = "eu-west-1"
}

# Outputs

output region { 
  value = var.region
  sensitive = true
}

output bucket_1 {
  value = aws_s3_bucket.bucket_1.id
}

output bucket_2 {
  value = aws_s3_bucket.bucket_2.id
}

output bucket_3 {
  value = aws_s3_bucket.bucket_3.id
}
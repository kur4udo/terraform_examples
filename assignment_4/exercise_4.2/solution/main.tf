# Exercise 4.2 - list and map - example solution
# main.tf

# Provider

provider "aws" {
  region = var.regions[var.env]
}

# Resources

resource "aws_s3_bucket" "bucket_1" {
  bucket = var.bucket_names[0]
  region = var.regions[var.env]
}

resource "aws_s3_bucket" "bucket_2" {
  bucket = var.bucket_names[1]
  region = var.regions[var.env]
}

resource "aws_s3_bucket" "bucket_3" {
  bucket = var.bucket_names[2]
  region = var.regions[var.env]
}

# List

variable bucket_names {
  description = "List with bucket names"
  type = list(string)
  default = [
    "bucket_1",
    "bucket_2",
    "bucket_3"
  ]
}

# Map

variable regions {
  description = "Map of regions assigned to environments"
  type = map(string)
  default = {
    dev = "eu-west-1",
    qa = "eu-west-2",
    prod = "eu-west-3"
  }
}

# Standard variable

variable env {
  description = "Select environment"
  type = string
}
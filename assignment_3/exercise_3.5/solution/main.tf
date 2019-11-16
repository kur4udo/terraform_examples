# Exercise 3.5 - More random resources
# main.tf

provider "aws" {
  region = "eu-west-1"
}

# Random provider -> random_integer

resource "random_integer" "ri" {
  min = 100000
  max = 900000
}

resource "aws_s3_bucket" "bucket_1" {
  bucket = "bucket-${random_integer.ri.id}"
}

# Random provider -> random_pet

resource "random_pet" "rp" {}

resource "aws_s3_bucket" "bucket_2" {
  bucket = "bucket-${random_pet.rp.id}"
}

# Random provider -> random_string

resource "random_string" "rs" {
  length  = 16
  special = false
  upper   = false
}

resource "aws_s3_bucket" "bucket_3" {
  bucket = "bucket-${random_string.rs.result}"
}
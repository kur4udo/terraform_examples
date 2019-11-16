# Exercise 3.4 - Random provider
# main.tf

provider "aws" {
  region = "eu-west-1"
}

# Random provider -> resource random_id

resource "random_id" "bucket_id" {
  byte_length = 8  
}

# Buckets with random names

resource "aws_s3_bucket" "bucket_1" {
  bucket = "bucket-${random_id.bucket_id.dec}"
}

resource "aws_s3_bucket" "bucket_2" {
  bucket = "bucket-${random_id.bucket_id.hex}"
}
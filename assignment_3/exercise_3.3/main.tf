# Exercise 3.3 - S3 resource
# main.tf

provider "aws" {
  region = ""
}

# Named bucket

resource "aws_s3_bucket" "bucket1" {
  bucket = ""
}

# Bucket with random name generated by Terraform

resource "aws_s3_bucket" "bucket2" {

}
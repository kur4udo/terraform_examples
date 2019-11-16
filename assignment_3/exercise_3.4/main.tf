# Exercise 3.4 - Random provider
# main.tf

provider "aws" {
  region = ""
}

# Random provider -> resource random_id

#resource "random_id" "bucket_id" {  
#  # Add byte_length attribute equal 8
#}

# Buckets with random names

resource "aws_s3_bucket" "bucket_1" {
  bucket = "" # Use dec attribute of random_id as a bucket name
}

# Define bucket resource as above but use hex attribute of random_id as a name
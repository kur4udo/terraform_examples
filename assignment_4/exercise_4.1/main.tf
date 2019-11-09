# Exercise 4.1 - Variables
# main.tf

provider "aws" {
  region = "eu-west-1" # replace with reference to variable
}

resource "aws_s3_bucket" "bucket_1" {
  bucket = "unique-bucket-name" # replace with reference to variable
}

# Create variable for region with description and default value



# Create variable for bucket with description


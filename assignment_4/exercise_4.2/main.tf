# Exercise 4.2 - list and map
# main.tf

# Provider

provider "aws" {
  region = "eu-west-1"  # Replace with reference to map. Put env variable as a label indicator.
}

# Resources

resource "aws_s3_bucket" "bucket_1" {
  bucket = "unique_bucket_name_1"       # Replace with reference to index 0 in the list with names
  region = "eu-west-1"                  # Replace with reference to map. Put env variable as a label indicator.
}

resource "aws_s3_bucket" "bucket_2" {
  bucket = "unique_bucket_name_2"       # Replace with reference to index 1 in the list with names
  region = "eu-west-1"                  # Replace with reference to map. Put env variable as a label indicator.
}

resource "aws_s3_bucket" "bucket_3" {
  bucket = "unique_bucket_name_3"       # Replace with reference to index 2 in the list with names
  region = "eu-west-1"                  # Replace with reference to map. Put env variable as a label indicator.
}

# Create list with three unique bucket names


# Create map with regions (for example: dev = "eu-west-1", qa = "eu-west-2", prod = "eu-west-3")


# Create string variable env

# Exercise 4.4 - count
# main.tf

# Provider

provider "aws" {
  region = var.region
}

# Resources

# Create bucket bucket_count_ex_1 with attributes:
# - region var.region
# - count 3


# Create bucket bucket_count_ex_2 with attributes:
# - region var.region
# - count 3
# To names add count.index


# Create bucket bucket_count_ex_3 with attributes:
# - region var.region
# - count as a length of list bucket_names
# Names taken from the list using count.index

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

# Create 3 outputs for resources:
# - bucket_count_ex_1
# - bucket_count_ex_2
# - bucket_count_ex_3
#
# Use * to get all buckets ids.

# Output bucket_count_ex_1


# Output bucket_count_ex_2


# Output bucket_count_ex_3


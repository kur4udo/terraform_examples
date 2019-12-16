# Exercise 6.2 - Splitting code - rest of content
# network.tf

## VPC

resource "aws_default_vpc" "default_vpc" {
  tags = {
    Name = "Default VPC"
  }
}
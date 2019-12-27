# Exercise 8 - Auto scaling
# network.tf

## VPC

resource "aws_default_vpc" "default_vpc" {
  tags = {
    Name = "Default VPC"
  }
}
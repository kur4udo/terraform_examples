# Exercise 8 - Autoscaling
# network.tf

## VPC

resource "aws_default_vpc" "default_vpc" {
  tags = {
    Name = "Default VPC"
  }
}
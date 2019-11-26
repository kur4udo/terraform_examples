# Exercise 5.2.1 - EC2 - AMI
# main.tf

provider "aws" {
  region = "eu-west-1"
}

## Data

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners = ["amazon"]
  
  filter {
    name = "name"
    values = ["amzn-ami-hvm*-x86_64-gp2"]
  }  
}

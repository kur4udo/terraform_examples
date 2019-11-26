# Exercise 5.2 - EC2
# main.tf

provider "aws" {
  region = "eu-west-1"
}

## Data - 5.2.1

# Create data "aws_ami" which is:
# - owned by amazon, 
# - most recent,
# - named amzn-ami-hvm*-x86_64-gp2 (use filter).

# For the reference: https://www.terraform.io/docs/providers/aws/d/ami.html

## VPC - 5.2.2

# Create resource "aws_default_vpc"

# "For the reference: https://www.terraform.io/docs/providers/aws/r/default_vpc.html"

## Security group - 5.2.3

# Create resource "aws_security_group" with:
# - ingress rule allowing port 22 tcp,
# - egress rule allowing everything,
# - vpc_id with aws_default_vpc id assigned (5.2.2).

# For the reference: https://www.terraform.io/docs/providers/aws/r/security_group.html

## EC2 - 5.2.4

# Create resource "aws_instance" with arguments:
# - ami equals aws_ami id (5.2.1),
# - instance type,
# - vpc security groups with security group created in 5.2.3.

# For the reference: https://www.terraform.io/docs/providers/aws/r/instance.html

## Public key - 5.2.5

# Create resource "aws_key_pair"
# - use public key from pair you have,
# - add key_name with reference to aws_key_pair to aws_instance created above.

# For the reference: https://www.terraform.io/docs/providers/aws/r/key_pair.html

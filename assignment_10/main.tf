# Exercise 10 - Workspaces
# main.tf

provider "aws" {
  region = var.region
}

## Add aws_availability_zones data
## For the reference: https://www.terraform.io/docs/providers/aws/d/availability_zones.html

data "aws_availability_zones" "available_zones" {
  state = "available"
}

module "compute" {
  source = "./compute"
  ami_owner = var.ami_owner
  ami_image = var.ami_image
  ingress_ports = var.ingress_ports
  servers_count = var.servers_count
  instance_type = var.instance_type
  public_key = var.public_key
  availability_zones = var.availability_zones # Replace with names attribute of aws_availability_zones.data
  listener_ports = var.listener_ports
  vpc_id = aws_default_vpc.default_vpc.id
}
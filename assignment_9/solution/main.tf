# Exercise 9 - Backend
# main.tf

provider "aws" {
  region = var.region
}

module "compute" {
  source = "./compute"
  ami_owner = var.ami_owner
  ami_image = var.ami_image
  ingress_ports = var.ingress_ports
  servers_count = var.servers_count
  instance_type = var.instance_type
  public_key = var.public_key
  availability_zones = var.availability_zones
  listener_ports = var.listener_ports
  vpc_id = aws_default_vpc.default_vpc.id
}
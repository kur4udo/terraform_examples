# Exercise 9 - Backend
# compute/variables.tf

# AMI

variable ami_owner {}

variable ami_image {}

# Web server security group

variable ingress_ports {    
    type = "list"
}

# EC2

variable servers_count {}

variable instance_type {}

# Public key

variable public_key {}

# ELB

variable availability_zones {}

variable listener_ports {    
    type = "map"        
}

# VPC

variable vpc_id {}
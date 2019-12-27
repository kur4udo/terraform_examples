# Exercise 10 - Workspaces
# variables.tf

# Region

variable region {
    #default = "eu-west-1"
}

# AMI

variable ami_owner {
    default = "amazon"
}

variable ami_image {
    default = "amzn-ami-hvm*-x86_64-gp2"
}

# Web server security group

variable ingress_ports {
    default = [22, 80]
    type = "list"
}

# EC2

variable servers_count {
    default = 2
}

variable instance_type {
    default = "t2.micro"
}

# Public key

variable public_key {
    description = "SSH public key"
}

# ELB

variable listener_ports {    
    type = "map"
    default = { 
        "instance_port" = 80, 
        "lb_port" = 80
    }    
}
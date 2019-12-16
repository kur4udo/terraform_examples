# Exercise 6.1 - Splitting code - variables

In this exercise we will create variables.tf file and move there values.

1. Create variables.tf file
2. Create variables for:
    - region,
    - aws_ami:
        - owner,
        - ami image (amzn-ami-hvm*-x86_64-gp2),
    - aws_security_group:
        - ingress rules - list with from_port and to_port,
    - aws_instance:
        - count,
        - instance_type,
    - public_key,
    - aws_elb:
        - availability_zones - list,
        - listener - map with instance_port and lb_port

In the end we will have three files: main.tf, variables.tf and web_server.tpl.

# Exercise 7 - Modules

In this exercise we will create module which will be responsible for creation of: EC2 and ELB.

1. Create compute directory,
2. Move to new directory:
    - loadBalancer.tf,
    - web_server.tpl,
    - webServer.tf.
3. Copy to new directory:
    - outputs.tf,
    - variables.tf.
4. Modify compute/variables.tf file to have empty definitions of variables:
    - ami_owner,
    - ami_image,
    - ingress_ports,
    - servers_count,
    - instance_type,
    - public_key,
    - availability_zones,
    - listener_ports,
    - vpc_id.
5. Modify main.tf file:
    - add module compute,
    - assign variables listed in point 4.
6. Modify compute/webServer.tf:
    - vpc_id in aws_security_group to use var.vpc_id,
    - user_data in aws_instance to "${path.module}/web_server.tpl"
7. Modify outputs.tf
    - change output load_balancer_dns to get value from module.compute.load_balancer_dns

After all above changes, our module will be ready.

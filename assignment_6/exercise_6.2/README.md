# Exercise 6.2 - Splitting code - rest of content

In this exercise we will split our code even more creating separate files for outputs, network, load balancer and EC2.

1. Create outputs.tf file and move output load_balancer_dns there,
2. Create network.tf file and move there resource aws_default_vpc,
3. Create loadBalancer.tf file and move there resource aws_elb,
4. Create webServer.tf file and move there:
    - data aws_ami,
    - resource aws_security_group,
    - resource aws_instance,
    - resource aws_key_pair.

After changes we will have 7 files:

- main.tf,
- network.tf,
- loadBalancer.tf,
- webServer.tf,
- variables.tf,
- outputs.tf,
- web_server.tpl.

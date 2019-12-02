# Exercise 5.4 - Load Balancer

In this exercise we will create Load Balancer for distributing http traffic to our instances.

1. Create aws_elb with:
    - availability_zones - add all zones from region,
    - listener,
    - health_check,
    - instances - add all aws_instances,
    - cross_zone_load_balancing = true.
2. Add output for aws_elb dns_name attribute

As a result, we will get Load Balancer which points traffic between web servers.

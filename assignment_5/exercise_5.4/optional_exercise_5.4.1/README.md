# Exercise 5.4.1 - Application Load Balancer

In this exercise we will create Application Load Balancer.

1. Remove aws_elb resource,
2. Create:
    - aws_availability_zones data,
    - aws_default_subnet resource,
        - use count and length function to get all aws_availability_zones,
        - use count.index to assign value to availability_zone,
    - aws_lb resource,
    - aws_lb_listener resource,
    - aws_lb_target_group resource,
    - aws_lb_target_group_attachment resource,
        - use count to assign instances,
3. Add output for ws_lb dns_name attribute.

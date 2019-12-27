# Exercise 8 - Autoscaling

In this exercise we will create autoscaling group that will handle EC2 instances.

1. Edit compute/webServer.tf file:
    - add resources:
        - aws_launch_configuration,
        - aws_autoscaling_group.
    - remove aws_instance definition.
2. Edit compute.loadBalancer.tf file:
    - remove instances argument from aws_elb.

Now, EC2 servers will be managed by autoscaling group.

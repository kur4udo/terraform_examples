# Exercise 11 - Route 53
# network.tf

## VPC

resource "aws_default_vpc" "default_vpc" {
  tags = {
    Name = "Default VPC"
  }
}

## Route53

## Add aws_route53_zone resource with attributes:
## - name - use domain_name variable,
## - delegarion_set_id - use delegation_set variable.

## Add aws_route53_record resource with attributes:
## - name - use domain_name variable with web prefix (e.g. web.my_domain.com),
## - type = "A"
## - zone_id = aws_route53_zone id
## - alias {}
##    - name = aws_elb dns_name - output from compute module
##    - zone_id = aws_elb zone_id - output from compute module
##    - evaluate_target_health = false
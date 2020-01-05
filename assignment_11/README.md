# Exercise 11 - Route 53

In this example we will create Route 53 hosted zone and record set which will direct traffic to our web servers.

We will need fixed delegation set. It can be created using:
aws route53 create-reusable-delegation-set --caller-reference unique_value

(Optional)
If you have a domain registered, update it with name servers created above.

Now we can extend our code.

1. Add variables in variables.tf:
    - domain_name,
    - delegation_set.
2. Add in compute/output.tf:
    - output for load balancer zone_id attribute
3. Add to network.tf file two resources:
    - aws_route53_zone,
    - aws_route53_record.
4. Add to outputs.tf file:
    - output of aws_route53_record fqdn.

After apply we should be able to see our web page using domain name.

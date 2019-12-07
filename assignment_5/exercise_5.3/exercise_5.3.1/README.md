# Exercise 5.3.1 - User data

In this exercise we will add user_data to aws_instance which will contain commands needed to run httpd server.

1. Add ingress rule to security group for TCP port 80
2. Add user_data to aws_instance and as a value use HereDoc with bash commands:
    - install httpd,
    - create /var/www/html/index.html with simple html,
    - start httpd.

As a result, we will get Amazon Linux virtual machine with web server and simple webpage.

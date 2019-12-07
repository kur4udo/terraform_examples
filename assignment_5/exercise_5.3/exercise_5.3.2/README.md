# Exercise 5.3.2 - User data and template file

In this exercise we will create template file and use it as a user_data in aws_instance.

1. Create web_server.tpl file which will contain bash commands for:
    - installing httpd,
    - creating /var/www/html/index.html with simple html,
    - starting httpd.
2. Use file function which will read web_server.tpl file and pass it to user_data argument.

As a result, we will get Amazon Linux virtual machine hosting simple webpage.

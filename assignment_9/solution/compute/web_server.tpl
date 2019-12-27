#!/bin/bash
yum install -y httpd

web_server_hostname=`hostname`
echo "<h1>Web server $web_server_hostname</h1>" >> /var/www/html/index.html

service httpd start
chkconfig httpd on
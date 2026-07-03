#!/bin/bash
yum update -y
yum install httpd -y
systemctl start httpd
systemctl enable httpd
echo "Web Server from Auto Scaling" > /var/www/html/index.html

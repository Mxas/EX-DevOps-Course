#!/bin/bash

sudo yum update -y

sudo yum install -y httpd

sudo systemctl start httpd

sudo systemctl enable httpd

echo "Hello World! <br>Mindaugas Testing.<b> This is Linux/UNIX" > /var/www/html/index.html
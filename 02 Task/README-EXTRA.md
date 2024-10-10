

# Allowing Ubuntu Security Group inbound 3128 traffic

    resource "aws_vpc_security_group_ingress_rule" "EC2-SG-Instance-B-proxy" {
        security_group_id = aws_security_group.EC2-SG-Instance-B.id
        cidr_ipv4         = "0.0.0.0/0"
        from_port         = 3128
        ip_protocol       = "tcp"
        to_port           = 3128
    }


# Installing Proxy squid on ubuntu


    sudo apt install -y squid
    systemctl enable squid
    sed -i 's/http_access deny all/http_access allow all/' /etc/squid/squid.conf 
    sudo systemctl status squid
    sudo systemctl restart squid


# In Private EC2 Linux enabling and testing proxy


    ping 172.31.33.35
    curl -v -x http://172.31.33.35:3128 http://www.google.com/

    export http_proxy=http://172.31.33.35:3128
    export https_proxy=http://172.31.33.35:3128

# In Private EC2 Linux installing nginx

    sudo yum update
    yum install nginx
    sudo systemctl enable nginx
    sudo systemctl start nginx
    sudo systemctl status nginx

    echo "Hello World! <br>Mindaugas Testing.<b> This is Linux/UNIX" > /usr/share/nginx/html/index.html

# Again from Ubuntu doing curl to Linux

    curl 172.31.41.159

![curl-from-ubuntu.png](docs%2Fcurl-from-ubuntu.png)
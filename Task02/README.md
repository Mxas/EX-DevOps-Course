

# terraform commands

    terraform init
    terraform plan -var-file=env/t1.tfvars
    terraform apply -var-file=env/t1.tfvars -auto-approve
    terraform destroy -var-file=env/t1.tfvars -auto-approve


# terraform plan
Output: [plan.txt](docs%2Fplan.txt)

# Resources:

- https://github.com/pradeepbhadani/tf-examples
- https://github.com/hashicorp/learn-terraform-aws-default-tags
- https://github.com/aws-samples/secured-bastion-host-terraform/tree/main
- https://towardsaws.com/creating-a-bastion-host-for-secure-access-to-your-aws-infrastructure-with-terraform-17ee287bb3d


    eval "$(ssh-agent -s)"
    ssh-add -K key.pem
    ssh –A ec2-user@<PUBLIC-IP-address>

- https://stackoverflow.com/questions/49023179/how-to-ssh-from-an-ec2-instance-to-another-ec2-instance-without-storing-the-publ

- https://aws.amazon.com/blogs/networking-and-content-delivery/how-to-use-aws-privatelink-to-secure-and-scale-web-filtering-using-explicit-proxy/


# Utilities ...

Instance-A-Linux-private-ip = "172.31.41.159"
Instance-B-Ubuntu-private-ip = "172.31.33.35"
Instance-B-Ubuntu-public-ip = "3.125.19.229"


    ssh-add mk--ex-keys.pem
    scp mk--ex-keys.pem ubuntu@3.125.19.229:/home/ubuntu
    ssh -A ubuntu@3.125.19.229
    chmod 400 mk--ex-keys.pem



    ssh -i mk--ex-keys.pem ec2-user@172.31.41.159




## AWS Linux
    sudo yum -y install nginx


# Proxy.. 

## Ubuntu
    sudo apt install -y squid
    
    systemctl enable squid
    sed -i 's/http_access deny all/http_access allow all/' /etc/squid/squid.conf

//    echo 'acl allow_my_ip src 0.0.0.0/32' | sudo tee -a /etc/squid/squid.conf

    systemctl start squid


    sudo systemctl status squid
    sudo systemctl restart squid
    


## Linux 

    ping 172.31.33.35
    curl -v -x http://172.31.33.35:3128 http://www.google.com/

    export http_proxy=http://172.31.33.35:3128
    export https_proxy=http://172.31.33.35:3128


From outside:

    curl -v -x http://3.125.19.229:3128 http://www.google.com/


nx

    sudo yum update
    yum install nginx
    sudo systemctl enable nginx
    sudo systemctl start nginx
    sudo systemctl status nginx

    echo "Hello World! <br>Mindaugas Testing.<b> This is Linux/UNIX" > /var/www/html/index.html

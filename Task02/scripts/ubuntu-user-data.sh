#!/bin/bash

#sudo apt update -y
sudo add-apt-repository ppa:ondrej/php -y

sudo apt update -y
sudo apt install -y php8.1

sudo rm /var/www/html/index.html
echo "Hello World! <br>Mindaugas Testing.<b> This is Ubuntu<br><hr><?php phpinfo(); ?><hr>" > /var/www/html/index.php




# Add Docker's official GPG key:
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

sudo apt-get install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin


# Proxy

sudo apt install -y squid
systemctl enable squid
sed -i 's/http_access deny all/http_access allow all/' /etc/squid/squid.conf
systemctl start squid
sudo systemctl status squid
sudo systemctl restart squid


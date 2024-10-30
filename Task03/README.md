Task 3. Using AWS Ec2 instance for playing with docker.

# Terraform commands

    terraform init
    terraform plan -var-file=env/t1.tfvars
    terraform apply -var-file=env/t1.tfvars -auto-approve
    terraform destroy -var-file=env/t1.tfvars -auto-approve



# 1.1 Docker install

[ubuntu-user-data.sh](scripts%2Fubuntu-user-data.sh)

# 2. Docker hello world

    docker pull hello-world
    docker run hello-world

## 2.1 Docker nginx Mindaugas 2024

    docker run -it --rm -d -p 80:80 --name web nginx

    docker exec -it web bash
    cd /usr/share/nginx/html
    echo "Mindaugas 2024" >> index.html
    exit
    curl localhost:80
    docker stop web
![2.1.png](docs%2F2.1.png)

### Or with image build

    docker build ./files/page/ -t web-image:v1 
    docker images
    docker run -d -p 80:80 --name page web-image:v1

    curl localhost:80

![curl2.png](docs%2Fcurl2.png)

# 3.1. + 3.2. Docker image build with env variable
 
    docker build ./files/app/ -t mxas1/spring-image:latest
    docker run -it --rm -d -e "DEVOPS=t001" -p 8080:8080 --name app mxas1/spring-image:latest

    curl localhost:8080

![curl-spring.png](docs%2Fcurl-spring.png)

##  3.1.1 docker image use clear basic images

Docker file [Dockerfile](files%2Fapp%2FDockerfile)
Scripts [bootstrap.sh](files%2Fapp%2Fbootstrap.sh)

# 4. and 4.1. Docker Hub and GitHUb Actions

Docker file [Dockerfile](files%2Fapp%2FDockerfile)
Build and Push [docker-image.yml](..%2F.github%2Fworkflows%2Fdocker-image.yml)

# 5. DOcker compose

File: [docker-compose.yml](files%2Fcompose%2Fdocker-compose.yml)

    docker-compose up
    docker-compose down

## 5.1. Retrieve data from the DB

http://localhost:8080 returns students count

![curl-spring.png](docs%2Fcurl-spring.png)

## 5.2. Use env file

File [.env](files%2Fcompose%2F.env)



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
    docker build -t web-image:v1 -f files/page/Dockerfile .
    docker images
    docker run -d -p 80:80 web-image:v1

    curl localhost:80

# 3.1. + 3.2. Docker image build with env variable
 
    docker build -t spring-image:v1 -f files/app/Dockerfile .
    docker run -it --rm -d -e "DEVOPS=t001" -p 8080:8080 --name app spring-image:v1

    curl localhost:8080



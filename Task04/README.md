Task 4

# Terraform commands

    terraform init
    terraform plan -var-file=env/t1.tfvars
    terraform apply -var-file=env/t1.tfvars -auto-approve
    terraform destroy -var-file=env/t1.tfvars -auto-approve



https://medium.com/@prashant.gaur.dev/installing-jenkins-on-a-docker-container-a-step-by-step-guide-6c7b4a81c4fb

docker run -d -p 8080:8080 -p 50000:50000 -v jenkins_data:/var/jenkins_home --name jenkins jenkins/jenkins

docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
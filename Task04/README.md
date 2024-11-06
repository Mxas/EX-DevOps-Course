Task 4

# Terraform commands

    terraform init
    terraform plan -var-file=env/t1.tfvars
    terraform apply -var-file=env/t1.tfvars -auto-approve
    terraform destroy -var-file=env/t1.tfvars -auto-approve



https://medium.com/@prashant.gaur.dev/installing-jenkins-on-a-docker-container-a-step-by-step-guide-6c7b4a81c4fb
https://medium.com/@mudasirhaji/complete-step-by-step-jenkins-cicd-with-github-integration-aae3961b6e33

docker run -d -p 8080:8080 -p 50000:50000 -v jenkins_data:/var/jenkins_home --name jenkins jenkins/jenkins

docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword



# Tasks
1. Install Jenkins. It must be installed in a docker container.
2. Add maven/gradle plugins like: checkstyle, spotbugs, dependency-check.
3. Create several branches in your Git repository: one branch should contain good code, other branches should violate one of the plugins above.
4. Create a Jenkins pipeline that will build your project. It should fail if there are any violations of above.
5. Create a yaml linter for the spring config. Use github actions. If the linter fails you shouldn’t be able to merge the PR(The option can be configured for free but won’t be operational. That is OK).



# EXTRA
1. Configure integration between Jenkins and your Git repo. Jenkins project must be started automatically if you push or merge to master, you also must see Jenkins last build status(success/unsuccess) in your Git repo.
2. Configure several (2-3) build agents. Agents must be run in docker.
3. Create Pipeline which will execute docker ps -a in docker agent, running on Jenkins master’s Host.

# Task 1

Installing Docker in EC2 [ubuntu-user-data.sh](awsinfra%2Fscripts%2Fubuntu-user-data.sh) and starting Jenkins [docker-compose.yml](awsinfra%2Ffiles%2Fdocker-compose.yml) 

# Task 2 

Plugins added [build.gradle](demo%2Fbuild.gradle)

# Task 3

- Good: main
- Bad: task4-test2
- PR: https://github.com/Mxas/EX-DevOps-Course/pull/1

# Task 4

Jenkins pipeline: [Jenkinsfile](demo%2FJenkinsfile)

![Successful Pipeline](docs%2Fgreem_pip.png)
![Failed Pipeline](docs%2Fred_pipe.png)

# Task 5

yaml linter check in GitHub:  [Task04_linter.yml](..%2F.github%2Fworkflows%2FTask04_linter.yml)

# Extra 1

- Installed in Jenkins GitHub integration plugin
- In GitHUb Project Registered public ip with 8080 webhook to Jenkins

![github_webhooks.png](docs%2Fgithub_webhooks.png)
![webhook_start.png](docs%2Fwebhook_start.png)


# Extra 2

[Example1](https://github.com/ashiqursuperfly/Jenkins-Controller-Agent-Setup)
[Example2](https://www.jenkins.io/doc/book/using/using-agents/)

Agent docker-compose file:  [docker-compose-agents.yml](awsinfra%2Ffiles%2Fdocker-compose-agents.yml)



    ssh-keygen -t rsa -f jenkins_agent_1
    passpshase aa

    docker-compose -f docker-compose-agents.yml up -d 


# Extra 3

Added volumes  


     - /usr/bin/docker:/usr/bin/docker
     - /var/run/docker.sock:/var/run/docker.sock

![docker-ps.png](docs%2Fdocker-ps.png)
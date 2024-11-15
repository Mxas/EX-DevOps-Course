Task 4

# Terraform commands

    terraform init
    terraform plan -var-file=env/t1.tfvars
    terraform apply -var-file=env/t1.tfvars -auto-approve
    terraform destroy -var-file=env/t1.tfvars -auto-approve

# Documentation 
https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
https://www.youtube.com/watch?v=X48VuDVv0do&ab_channel=TechWorldwithNana
https://gitlab.com/nanuchi/youtube-tutorial-series/-/blob/master/

https://devopscube.com/jenkins-build-agents-kubernetes/
https://medium.com/@marouanetester/how-to-install-jenkins-on-kubernetes-e50402d912b9
https://phoenixnap.com/kb/jenkins-kubernetes
https://docs.cloudbees.com/docs/cloudbees-ci-kb/latest/client-and-managed-controllers/create-dedicated-agents-running-in-kubernetes


# Tasks
1. Deploy kubernetes cluster. (Note: There are many ways to deploy a kubernetes cluster or its emulation. 
2. The deployment itself may be more complex than the rest of this task). You can use any method you want, we'll just list some of them from simple to complex.
   minikube
   kind
   kubespray
   eksctl
   terraform eks
   AWS/GKE manually
   “bare metal” manually

2. Get a list of nodes, pods, deployments, services, namespaces of your cluster.

3. Use your docker compose from Task 3 - docker. (item 3.1.). Develop kubernetes manifests to deploy the same applications and their settings but in kubernetes.
   How can we make sure the application works and responds as expected?
   Extra 3.1. Use kubernetes secret/config maps for secrets and settings

4. Deploy nginx using a third party helm chart. How can we see the "hello world" web page in the browser?
   Extra 4.1. Develop a helm chart to deploy the set of applications from step 3.


    # sudo minikube start --force


    
    
    minikube status
    kubectl get nodes
    kubectl get all
    kubectl version



# Task 1 Install minikube 

[ubuntu-user-data.sh](awsinfra%2Fscripts%2Fubuntu-user-data.sh)

    sudo usermod -aG docker $USER && newgrp docker
    minikube start --driver=docker

# Task 2 kubectl commands

## Nodes
    kubectl get nodes
## Pod's
    kubectl get pod
## Deployments
    kubectl get deployments
## Services
    kubectl get services
## Namespace's
    kubectl get namespaces
## Replicaset's
    kubectl get replicasets


## Creating one pod of nginx
    kubectl create deployment nginx-depl --image=nginx

    kubectl edit deployment nginx-depl

    kubectl logs nginx-depl-5796b5c499-ck2n8
    kubectl exec -it nginx-depl-5796b5c499-ck2n8 -- bin/bash
    --kubectl describe service nginx-service --

    kubectl delete deployment nginx-depl
    
    kubectl apply -f nginx-deployment.yaml 

    kubectl apply -f files/mongodb-config-components.yaml
    minikube service mongo-express-service
      kubectl expose deployment mongo-express --type=LoadBalancer --name=mongo-express

    kubectl expose deployment
 


# Task 3

[jenkins.yaml](awsinfra%2Ffiles%2Fjenkins.yaml)
      
      kubectl create -f files/jenkins.yaml
      kubectl get all 
      minikube service jenkins
      
![jenkins-agent.png](docs%2Fjenkins-agent.png)

# Task 4

      winget install Helm.Helm

      helm create [nginx-chart](awsinfra%2Ffiles%2Fnginx-chart)

      helm install nginx-t1 .\nginx-chart\

      helm list -a

![helm.png](docs%2Fhelm.png)


# Task 4.1
Not tested ... done with https://github.com/kubernetes/kompose/

[docker-compose](awsinfra%2Ffiles%2Fdocker-compose)

      helm create [nginx-chart](awsinfra%2Ffiles%2Fnginx-chart)

      helm install jenkins_test_2-t1 .\docker-compose\


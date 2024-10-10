

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



# Utilities

    ssh-add mk--ex-keys.pem
    ssh -A ubuntu@18.198.50.117
    ssh -i mk--ex-keys.pem ec2-user@172.31.36.223

    scp mk--ex-keys.pem ubuntu@18.198.50.117:/home/ubuntu

    chmod 400 mk--ex-keys.pem


## AWS Linux
    sudo yum -y install nginx
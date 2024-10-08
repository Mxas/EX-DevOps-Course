# Tasks (mandatory):
Sign up for AWS, familiarize yourself with the basic elements of the AWS Home Console GUI.
Explore AWS Billing for checking current costs.
Create two EC2 Instance t2.micro with different operating systems (Amazon linux / Ubuntu ...). Try to stop them, restart, delete, recreate.
Make sure there is an SSH connection from your host to the created EC2. What IP EC2 used for it?
Make sure  ping and SSH are allowed from one instance to another in both ways. Configure SSH connectivity between instances using SSH keys.
Install web server (nginx/apache) to one instance;
- Create a web page with the text “Hello World” and additional information about OS version, free disk space,  free/used memory in the system and about all running processes;
- Make sure your web server is accessible from the internet and you can see your web page in your browser;
- Make sure on the instance without nginx/apache you also may see the content of your webpage from the instance with nginx/apache.



# Instances
- Instance A (aws-linux) public [IP](http://18.184.40.178)
- Instance B (ubuntu) public [IP](http://3.120.15.64)

# Security groups

![Instance A SG](https://temp-teask01.s3.us-east-2.amazonaws.com/SG-A.png)

![Instance B SG](https://temp-teask01.s3.us-east-2.amazonaws.com/SG-B.png)


# Ping

![ssh-pings.png](https://temp-teask01.s3.us-east-2.amazonaws.com/ssh-pings.png)

# SSH connection 

![ssh-connections.png](https://temp-teask01.s3.us-east-2.amazonaws.com/ssh-connections.png)


# Web Page php script file

[index.php](index.php)

Web page view:
![web-page.png](https://temp-teask01.s3.us-east-2.amazonaws.com/web-page.png)

# Curl call from instance A

![curl.png](https://temp-teask01.s3.us-east-2.amazonaws.com/curl.png)
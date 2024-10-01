


# Optional 1

## Security Groups


### Creating Security Group in VPC1

SG_A=$(aws ec2 create-security-group --group-name Instanc-A-SG \
                                    --description "EC2 Testing for Instanc-A" \
									--profile mk-ex --region eu-central-1 \
									--vpc-id vpc-04cd8ea30091454f5 --query 'GroupId' --output text)
echo "Security Group A ID: $SG_A"

### Creating Inbould rules SG_A

aws ec2 authorize-security-group-ingress \
    --group-id "$SG_A" \
	--profile mk-ex --region eu-central-1 \
    --ip-permissions IpProtocol=tcp,FromPort=22,ToPort=22,IpRanges=[{CidrIp=78.31.189.47/32}] \
	                 IpProtocol=icmp,FromPort=8,ToPort=-1,IpRanges=[{CidrIp=0.0.0.0/0}] 


### Creating Security Group in VPC2

SG_B=$(aws ec2 create-security-group --group-name Instanc-B-SG \
                                    --description "EC2 Testing for Instanc-B" \
									--profile mk-ex --region eu-central-1 \
									--vpc-id vpc-0b5eec3c68104bff5 --query 'GroupId' --output text)
echo "Security Group B ID: $SG_B"

### Creating Inbould rules SG_B

aws ec2 authorize-security-group-ingress \
    --group-id "$SG_B" \
	--profile mk-ex --region eu-central-1 \
    --ip-permissions IpProtocol=tcp,FromPort=22,ToPort=22,IpRanges=[{CidrIp=78.31.189.47/32}] \
	                 IpProtocol=icmp,FromPort=8,ToPort=-1,IpRanges=[{CidrIp=0.0.0.0/0}] \
					 IpProtocol=tcp,FromPort=80,ToPort=80,IpRanges=[{CidrIp=0.0.0.0/0}] 


aws ec2 authorize-security-group-ingress \
    --group-id "$SG_B" \
    --profile mk-ex --region eu-central-1 \
    --protocol tcp \
    --port 80 \
    --source-group "$SG_A"




## EC2 Instances

### Instance A (no http access, just ping and ssh)

INSTANCE_A=$(aws ec2 run-instances \
    --profile mk-ex --region eu-central-1 \
    --image-id ami-0e04bcbe83a83792e \
	--subnet-id subnet-0badf3a2e7169eda7 \
	--count 1 \
	--instance-type t2.micro \
	--key-name mk--ex-keys \
	--security-group-ids "$SG_A" \
	--tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=Instanc-A}]' \
	--query 'Instances[0].InstanceId' --output text)

aws ec2 wait instance-running --instance-ids "$INSTANCE_A" --profile mk-ex --region eu-central-1
IP_A=$(aws ec2 describe-instances --instance-ids "$INSTANCE_A" \
    --profile mk-ex --region eu-central-1 \
    --query 'Reservations[*].Instances[*].PublicIpAddress' \
    --output text)
echo "Instance A is up and running with ID: $INSTANCE_A and with public IP: $IP_A"
ping -n 6 "$IP_A"


### Instance B Ubuntu (has http access, ping and ssh)

INSTANCE_B=$(aws ec2 run-instances \
    --profile mk-ex --region eu-central-1 \
    --image-id ami-00f07845aed8c0ee7 \
	--subnet-id subnet-015f06cdc72049784 \
	--count 1 \
	--instance-type t2.micro \
	--associate-public-ip-address \
	--key-name mk--ex-keys \
	--security-group-ids "$SG_B" \
	--user-data file://opt-user-data.sh \
	--tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=Instanc-B}]' \
	--query 'Instances[0].InstanceId' --output text)

aws ec2 wait instance-status-ok --instance-ids "$INSTANCE_B" --profile mk-ex --region eu-central-1
IP_B=$(aws ec2 describe-instances --instance-ids "$INSTANCE_B" \
    --profile mk-ex --region eu-central-1 \
    --query 'Reservations[*].Instances[*].PublicIpAddress' \
    --output text)
echo "Instance B is up and running with ID: $INSTANCE_B and with public IP: $IP_B"
ping -n 6 "$IP_B"
curl -s "$IP_B"




### Clean up

#### optional
aws ec2 stop-instances \
    --profile mk-ex --region eu-central-1 \
    --instance-ids "$INSTANCE_A" "$INSTANCE_B"

aws ec2 terminate-instances \
    --profile mk-ex --region eu-central-1 \
    --instance-ids "$INSTANCE_A" "$INSTANCE_B"

aws ec2 delete-security-group --group-id "$SG_B" --profile mk-ex --region eu-central-1

aws ec2 delete-security-group --group-id "$SG_A" --profile mk-ex --region eu-central-1



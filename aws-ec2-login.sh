#!/bin/bash

# Retrieve the public DNS name of the EC2 instance

public_dns=$(aws ec2 describe-instances --instance-ids i-05ed47b0e5afa105f --query "Reservations[].Instances[].PublicDnsName" --output text)

# SSH into the instance using the retrieved public DNS name

ssh -i key.pem ubuntu@"$public_dns"

ELB (Elastic Load Balancer)
Load balancer is like trafic manager for web applications. It evenly distributes incoming web trafic among multiple servers, ensuring no single server gets overwhelmed, thus improving performance and reliability
It always sends the traffic to Healthy Instance 
It Makes Web servers Highly Available and Fault Tolerant

Load Balancers are servers that forward traffic to multiple downstream servers. 
It spreads load across multiple downstream instances. 
It helps to expose a single point of access to your application. 
It handles failures of the downstream instances by doing regular health checks.

It provides SSL termination for your websites and enforces stickiness with cookies. 


1. Classic Load Balancer (CLB): 

CLB is a basic load balancer that operates at either the application layer (layer 7)or network layer (layer 4) and supports HTTP, HTTPS and TCP
Classic Load Balancer is the oldest type of Load balancer in AWS designed to handle traffic at both the request and connection level.
It routs traffic between clients and backend services such as amazon EC2 and Containers

Classic Load Balancer Enables multiple cloud resources to be accessed through a single endpoint,simplify access and improve scalability.
It is limited to handle traffic at the request and connection level only


Limitation:

  Classic LB per region – 20

Load Balancer Components Limits:

   Listeners – 50
   Security Group – 5
   Registered Instances – 1000>
   Subnet per Availability zone – 1


Demo
Create Desired Numbers of Instances with web servers and Security Group from Load Balancer 
Or Boot Process using User Data 
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install nginx -y
    sudo echo "this is private IP of machine $(hostname)" > /var/www/html/index.html

Create Load Balancer -> Select Classic Load Balancer
Select VPC in which EC2 in configured -> select AZs of VPC for all the EC2 Insatnces
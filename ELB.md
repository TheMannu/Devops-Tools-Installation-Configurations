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
Select Sequrity Group For Classic Load Balancer
Configure LB listening Port and then Instance Listening Port
Configure Ping Path 

Configure Health Check -> 
  Response timeout
   Time to wait for EC2 instances to respond to health checks.
  Unhealthy threshold
   Number of consecutive health check failures before declaring an EC2 instance unhealthy.
  Interval
   Amount of time between health checks sent to EC2 instances.
  Healthy threshold
   Number of consecutive health check successes before declaring an EC2 instance healthy.
  
  Select All the Configured Instances or Servers in which Traffic should be distributed

Enable cross-zone load balancing
Enable connection draining


Review the configuration and Click Create Load Balancer

Wait for the instance to become "In Service" 

Now All the servers can be accessed using DNS name in your browser and check load balancing by doing Refresh



2. Application Load Balancer (ALB):This is a load balancer that routes traffic to target groups based on the content of the request. It operates at the application layer (layer 7 in the OSI model) and supports HTTP, HTTPS, and WebSocket traffic. ALB is designed to handle high levels of traffic and provides advanced request routing features, such as support for multiple protocols, path-based routing, and ability to bind to multiple SSL certificates.

 An ALB is type of LB that operates at Application Layer (Layer 7), making it intelligent and capable of routing traffic based on content. 
It is designed for modern application that rely on multiple services(Microservices).
ALB send Load to the target groups and the target group contains list of Compute engines , Instances, Noddes or container etc.
There could be number of target groups
By default have Cross Zone Load Balancing Enabled

ALB can disribute load on basis of  Path, Query, Port, Source IP
query string - platform = mobile


We can also Enable SSL certification On ALB in ADD Listner Section HTTPS protocol 
using ACM (amazon certificate manager) or IAM, or Any thirt party certificate so that the request from clent to server will get encrypted
By default have Cross Zone Load Balancing Enabled


Limitation:

Application LB per region – 20
Target groups – 3000

Load Balancer Components Limits:

Listeners – 50
Targets load balancer – 1000
Subnet per Availability zone – 1
Rules – 100
Security groups – 5



Demo
Step 1: Configure Your Target Group
Create Desired Numbers of Instances with web servers and Security Group from Load Balancer 
Or Boot Process using User Data 
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install nginx -y
    sudo echo "this is private IP of machine $(hostname)" > /var/www/html/index.html

Inside Load balancer section -> select Target Group -> select target type such as Instance , IP addresses, Lambda Function or Application Load balancer
Provide a Name to the target Group should be unique per Account per Region
Adjust Protocol and Port of Instance or Application 
(If traget type is Instance or IP address -> select IPv4 or IPv6 as IP address and it cannot be changed after creation of Target Group)
Select VPC which have all the resources
Select the Protocol Version
Customize Health Checks As per Your Requirement 


Add targets:
If the target type is Instances, select instances, enter ports, and choose "Include as pending."
If the target type is IP addresses, select a network VPC, enter IP addresses and ports, then choose "Include as pending."
If the target type is a Lambda function, specify a single Lambda function or skip this step.


Click on "Create Target Group"

Step 2: Choose a Load Balancer Type
1. On the navigation bar, select a Region for your load balancer. Make sure it's the same Region you used for your EC2 instances.
2. In the navigation pane under Load Balancing, click on Load Balancers.
3. Choose "Create Load Balancer."
4. Select "Create" for Application Load Balancer.

Step 3: Configure Your Load Balancer and Listener
1. Load Balancer Name: Enter a name for your load balancer, e.g., "my-alb."
2. Scheme and IP Address Type: Retain the default values.
3. Network Mapping: Choose the VPC used for your EC2 instances. Select at least two Availability Zones and one subnet per zone. For each Availability Zone used to launch EC2 instances, select the Zone and choose one public subnet for that Zone.
4. Security Groups: Choose the default security group for the selected VPC. Alternatively, select a different security group. Ensure the security group has rules permitting communication between the load balancer and registered targets on both the listener port and the health check port. Refer to Security group rules for more details.
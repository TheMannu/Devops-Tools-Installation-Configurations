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
5. Listeners and Routing: Keep the default protocol and port. Select your target group from the list. This configures a listener accepting HTTP traffic on port 80, forwarding it to the chosen target group by default. No HTTPS listener is created for this tutorial.
6. Default Action: Choose the target group created and registered in Step 1: Configure your target group.
7. Optional: Add a Tag: Include a tag to categorize your load balancer. Tag keys must be unique, allowing letters, spaces, numbers (in UTF-8), and special characters like + - = . _ : / @. Avoid leading or trailing spaces, and note that tag values are case-sensitive.
8. Review Configuration: Assess your settings and select "Create load balancer." The system applies a few default attributes during creation, editable post-creation. Refer to Load balancer attributes for additional information.

#### Step 4: Verify Your Load Balancer's Performance

To check your load balancer, follow these steps:

1. Close Notification:
    Once you receive confirmation that your load balancer was created successfully, click "Close."

2. Navigate to Target Groups:
    In the navigation pane, go to "Load Balancing" and select "Target Groups."


3. Select Target Group:
    Pick the newly created target group.

4. Verify Instance Readiness:
    Click on "Targets" and confirm that your instances are ready. If an instance's status is "initial," it may still be in the registration process or has not passed the minimum health checks to be considered healthy. Once at least one instance shows a healthy status, you can proceed to test your load balancer.

5. Access Load Balancers:
    In the navigation pane, under "Load Balancing," choose "Load Balancers."

6. Choose Load Balancer:
    Select the recently created load balancer.

7. Copy DNS Name:
    Under "Description," copy the DNS name of the load balancer (e.g., my-load-balancer-1234567890abcdef.elb.us-east-2.amazonaws.com).

8. Paste in Browser:
    Paste the copied DNS name into the address field of an internet-connected web browser. If everything is functioning correctly, the browser should display the default page of your server.

9. Optional - Add Listener Rules:
    To include additional listener rules, refer to "Add a rule." To enhance your setup, consider adding additional listener rules.


## Path-Based Routing url - < public IP /test/ >

Create Desired Numbers of Instances with web servers and Security Group from Load Balancer 
Or Boot Process using User Data 
    url - < public IP /test >

#!/bin/bash

sudo apt-get update
sudo apt-get install nginx -y

mkdir -p /var/www/html/test

sudo echo "this is private IP of machine $(hostname)" > /var/www/html/test/index.html


Path-based routing is a crucial concept in modern web architecture, allowing us to direct incoming traffic to different backend services based on the URL path. In this blog post, we'll delve into what path-based routing is, how it can be used effectively, and walk through a step-by-step guide to configuring it using AWS Application Load Balancer (ALB). By the end, you'll have a clear understanding of path-based routing and be ready to implement it in your own projects.

1. What is Path-Based Routing?
Path-based routing involves directing incoming requests to different backend services based on the URL path. For example, you can route requests to /app1/* to one service and requests to /app2/* to another service.

2. How Can We Use Path-Based Routing?
Path-based routing is incredibly useful in scenarios where you have multiple applications or microservices running on the same domain or server. It allows you to efficiently manage traffic by directing requests to the appropriate backend service based on the requested path.

3. Use Cases of Path-Based Routing:
- Microservices Architecture: In a microservices architecture, different microservices often handle different functionalities. Path-based routing enables you to route requests to the corresponding microservice based on the requested path.

- API Gateway: When building APIs, path-based routing can be used to route requests to different API endpoints based on the URL path, providing a clean and organized API structure.

- Multi-Tenancy Applications: In multi-tenancy applications, path-based routing can be used to route requests to different tenants based on the URL path, allowing for efficient resource allocation and isolation.

4. How to Configure Path-Based Routing in AWS ALB:
- Step 1: Create an Application Load Balancer (ALB) in the AWS Management Console.
- Step 2: Define target groups for different backend services.
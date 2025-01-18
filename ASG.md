ASG (Auto Scaling Group)

After deploying machines if it goes down by any reson . ASG helps ins Auto creating the same machines by itself and deploy to retain the existing Number of machines to prevent tohe servieces by going down.

The Autoscaling feature is used to scale up and down automatically as and when required.
The application available at AWS requires space and load and the Auto Scaling helps us by providing surety that there is a sufficient number of Amazon EC2 instances available to handle that load.
You can set a limit on EC2 instances such that the number doesn't go below this.Also maximum numbers of EC2 instances can be set to be on a safer side.
AWS Autoscaling ensures that your group has a sufficient amount of servers.
Auto-scaling automatically modifies the EC2 instance as per your demand changes.


## Features of Amazon EC2 Auto Scaling

- Monitoring the health of running instances
- Custom health checks as defined by User
- Balancing capacity across Availability Zones
- Multiple instance types and purchase options (Spot and On-Demand Instances)
- Automated replacement of Spot Instances
- Load balancing
- Scalability
- Instance refresh
- Lifecycle hooks
- Support for stateful workloads

## No additional fee or Pricing for Amazon EC2 Auto Scaling

## Auto Scaling policies or Types

1. Dynamic scaling policies - Dynamic scaling policies use real-time data to scale your group based on configurable metrics.
     - Amazon EC2 Auto Scaling can add more instances (referred to as scaling out) to deal with high demand at peak times, and run fewer instances (referred to as scaling in) to reduce costs during periods of low utilization. 
     
    - Target tracking policy (Creats CloudWatch by its self)

    - Step scaling policy
    - Simple scaling policy

2. Predictive scaling policies
3. Scheduled action

## Load Testing on Linux servers

sudo apt-get update
sudo apt-get install stress
stress -c 5
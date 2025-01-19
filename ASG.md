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

     - When you create a target tracking scaling policy, Amazon EC2 Auto Scaling automatically increases and decreases capacity in response to varying usage levels. For example, a target tracking scaling policy might have a target CPU value of 50 percent. Amazon EC2 Auto Scaling then launches and terminates EC2 instances as required to keep the aggregated CPU usage across all instances in your group at 50 percent.

     - With step scaling and simple scaling, you must create alarms in Amazon CloudWatch, and then define two policies, one for scaling out and the other for scaling in. Step scaling can make bigger or smaller size adjustments based on the metric value, while simple scaling always makes the same size adjustment.

     - Note - Capacity units takes into account the unit of measurement that you chose when configuring the Auto Scaling group. By default, one capacity unit represents one instance. If you chose to use multiple instance types and specify weights for each instance type, you set weights for each instance type in the units of your choice, such as virtual CPUs or memory. In this case, one capacity unit represents a single vCPU or GiB.

    - Target tracking policy (Creats CloudWatch by its self)

    - Step scaling policy
    - Simple scaling policy

2. Predictive scaling policies -  Predictive scaling policies use historical data to scale out your group ahead of forecasted hourly load.
    - Predictive scaling forecasts load based on your Auto Scaling group's history. It scales out the group in advance of forecasted load, so that new instances are ready to serve when the load arrives.
    - Predictive scaling works with CPU utilization, network in/out traffic, the request count to an Application Load Balancer target group, and custom metrics. 
    - We can use predictive scaling to improve availability for applications whose workloads have predictable daily or weekly cycles.
    - As a best practice, consider using both dynamic scaling and predictive scaling. Predictive scaling uses forecasts to make decisions about when to add capacity according to a metric's historical trends while dynamic scaling makes adjustments in response to real-time changes in a metric's value.


3. Scheduled action - Scheduled scaling helps you schedule capacity ahead of anticipated load. 

## Load Testing on Linux servers

sudo apt-get update
sudo apt-get install stress
stress -c 5
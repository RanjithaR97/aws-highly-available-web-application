# aws-highly-available-web-application
Deploy a highly available AWS web application using Amazon EC2, Application Load Balancer, Auto Scaling, Amazon EBS, and CloudWatch monitoring.

# Highly Available Web Application using Amazon EC2, Application Load Balancer, Auto Scaling, Amazon EBS & Amazon CloudWatch

## Project Overview

This project demonstrates how to deploy a highly available and scalable web application on AWS. The application is hosted on multiple Amazon EC2 instances across different Availability Zones, with an Application Load Balancer distributing incoming traffic. Auto Scaling automatically adjusts the number of EC2 instances based on CPU utilization, while Amazon EBS provides persistent storage and Amazon CloudWatch monitors the application's health and performance.

---

## Objective

Deploy a fault-tolerant web application on AWS that can automatically distribute traffic, recover from failures, scale according to demand, and provide continuous monitoring.

---

## AWS Services Used

* Amazon EC2
* Application Load Balancer (ALB)
* Amazon EC2 Auto Scaling
* Amazon Elastic Block Store (EBS)
* Amazon CloudWatch
* Amazon SNS (Optional for alerts)

---

## Key Features

* Multi-AZ deployment for High Availability
* Load balancing using Application Load Balancer
* Automatic scaling based on CPU utilization
* Persistent storage using Amazon EBS
* Performance monitoring using Amazon CloudWatch
* CloudWatch alarms for automated notifications
* Fault-tolerant architecture

---

## Prerequisites

* AWS Account
* IAM User with required permissions
* SSH Key Pair
* Security Groups
* Basic Linux command knowledge
* Basic AWS Console knowledge

---

## Architecture

```text
                 Internet Users
                        │
                        ▼
         Application Load Balancer
                        │
          ┌─────────────┴─────────────┐
          ▼                           ▼
     EC2 Instance                 EC2 Instance
        AZ-1                         AZ-2
          │                           │
          └─────────────┬─────────────┘
                        ▼
               Auto Scaling Group
                        │
              Amazon EBS Volumes
                        │
                Amazon CloudWatch
                        │
           CloudWatch Alarms / SNS Alerts
```

---

## Implementation Steps

### Step 1: Launch EC2 Instances

* Launched two Amazon EC2 instances.
* Selected Amazon Linux AMI.
* Used t2.micro instance type.
* Placed the instances in different Availability Zones.
* Configured Security Groups to allow HTTP and SSH access.

---

### Step 2: Install and Configure Apache Web Server

* Connected to each EC2 instance using SSH.
* Installed Apache HTTP Server.
* Started and enabled the HTTP service.
* Created a simple web page for testing.

---

### Step 3: Create and Attach Amazon EBS Volume

* Created a new Amazon EBS volume.
* Attached the volume to an EC2 instance.
* Formatted the volume using the ext4 file system.
* Mounted the volume for persistent storage.

---

### Step 4: Create Target Group

* Created a Target Group.
* Registered both EC2 instances.
* Configured HTTP health checks.

---

### Step 5: Create Application Load Balancer

* Created an Internet-facing Application Load Balancer.
* Selected multiple Availability Zones.
* Attached the Target Group.
* Verified successful load balancing.

---

### Step 6: Configure Launch Template

* Created a Launch Template.
* Selected the Amazon Linux AMI.
* Configured instance type, security group, and user data script.

---

### Step 7: Configure Auto Scaling Group

* Created an Auto Scaling Group using the Launch Template.
* Attached the Application Load Balancer.
* Configured:

  * Minimum Capacity: 2
  * Desired Capacity: 2
  * Maximum Capacity: 4

---

### Step 8: Configure Scaling Policy

* Configured Target Tracking Scaling Policy.
* Metric Used: Average CPU Utilization
* Target Value: 60%
* Auto Scaling launches new instances when CPU usage increases and removes instances when demand decreases.

---

### Step 9: Monitor Using Amazon CloudWatch

Monitored the following metrics:

**EC2 Metrics**

* CPU Utilization
* Network In
* Network Out
* Disk Read Operations
* Disk Write Operations

**Application Load Balancer Metrics**

* Request Count
* Target Response Time
* Healthy Hosts
* Unhealthy Hosts
* HTTP 4xx Errors
* HTTP 5xx Errors

---

### Step 10: Configure CloudWatch Alarm

* Created a CloudWatch Alarm.
* Selected CPU Utilization metric.
* Trigger Condition:

  * CPU Utilization > 80%
  * Duration: 5 Minutes
* Configured notifications using Amazon SNS.

---

## Testing

* Verified Apache web pages on both EC2 instances.
* Verified traffic distribution using the Application Load Balancer.
* Confirmed EC2 instances were healthy.
* Verified Auto Scaling configuration.
* Monitored CloudWatch metrics.
* Verified CloudWatch Alarm notifications.

---

## Project Outcome

Successfully deployed a highly available and fault-tolerant web application on AWS. The solution automatically distributes incoming traffic, scales based on CPU utilization, provides persistent storage using Amazon EBS, and continuously monitors system health using Amazon CloudWatch.

---

## Folder Structure

```text
aws-highly-available-web-application/
│
├── README.md
├── architecture/
│   └── architecture-diagrams.png
│
├── scripts/
│   ├── apache-install.sh
│   └── user-data.sh
│
├── screenshots/
│   ├── 01-EC2InstanceCreation.png
│   ├── 02-ALBCreation.png
│   ├── 03-ASGCreation.png
│   ├── 04-SNSSubscription.png
│   ├── 05-ASGCreationOutput.png
│   ├── 06-EBSAttachToEC2.png
│   ├── 07-EBSAttachedOutputServer.png
│   ├── 08-CPUUtilizationGraph.png
│   └── 09-CloudWatchAlaramOutput.png
│


---

## Screenshots
outputs of all are added in screenshit folder

---

## Skills Demonstrated

* Amazon EC2
* Application Load Balancer (ALB)
* Amazon EC2 Auto Scaling
* Amazon EBS
* Amazon CloudWatch
* High Availability Architecture
* Load Balancing
* Fault Tolerance
* Infrastructure Deployment
* Linux Administration

---

## Learning Outcomes

* Learned to deploy applications across multiple Availability Zones.
* Configured an Application Load Balancer for traffic distribution.
* Implemented Auto Scaling based on CPU utilization.
* Attached and managed Amazon EBS volumes.
* Monitored AWS resources using Amazon CloudWatch.
* Configured CloudWatch alarms and notifications.
* Built a production-style highly available AWS architecture.

---


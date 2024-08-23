### Project: Advanced Terraform with Provisioners, Modules, and Workspaces

#### Project Objective:

The project involves deploying a basic infrastructure on AWS using Terraform modules, executing remote commands on the provisioned resources using provisioners, and managing multiple environments using Terraform workspaces. All resources should be within the AWS Free Tier limits.

#### Project Overview:

Participants will create a Terraform configuration that deploys an EC2 instance and an S3 bucket using a custom Terraform module. The project will also require the use of Terraform provisioners to execute scripts on the EC2 instance. Finally, participants will manage separate environments (e.g., dev and prod) using Terraform workspaces.

### Terraform Modules:

Create a reusable module to deploy an EC2 instance and an S3 bucket.

The EC2 instance should be of type t2.micro, and the S3 bucket should be configured for standard storage.

The module should accept input variables for the instance type, AMI ID, key pair name, and bucket name.

Outputs should include the EC2 instance’s public IP and S3 bucket’s ARN.

#### Terraform Provisioners:

Use remote-exec and local-exec provisioners to perform post-deployment actions on the EC2 instance.

The remote-exec provisioner should be used to connect to the EC2 instance via SSH and run a script that installs Apache HTTP Server.

The local-exec provisioner should be used to output a message on the local machine indicating the deployment status, such as "EC2 instance successfully provisioned with Apache."

#### Terraform Workspaces:
Implement Terraform workspaces to manage separate environments (e.g., dev and prod).
Each workspace should deploy the same infrastructure (EC2 and S3) but with different configurations (e.g., different tags or bucket names).

Ensure that the state for each workspace is managed separately to prevent conflicts between environments.

#### Key Tasks:

#### Module Development:

Module Setup: Create a directory for the module (e.g., modules/aws_infrastructure).
Resource Definitions: Define the resources for an EC2 instance and an S3 bucket within the module.

Variable Inputs: Define input variables for instance type, AMI ID, key pair name, and S3 bucket name.

Outputs: Define outputs for the EC2 instance's public IP and the S3 bucket's ARN.

#### Main Terraform Configuration:

Main Config Setup: In the root directory, create a Terraform configuration that calls the custom module.

Backend Configuration: Configure Terraform to use local state storage for simplicity (optional for Free Tier compliance).
Provisioner Implementation:

Remote Execution: Use the remote-exec provisioner to SSH into the EC2 instance and execute a script that installs Apache.

Local Execution: Use the local-exec provisioner to print a confirmation message on the local machine after successful deployment.

#### Workspace Management:

Workspace Creation: Create Terraform workspaces for dev and prod.

Environment-Specific Configurations: Customize the EC2 instance tags and S3 bucket names for each workspace to differentiate between environments.
Workspace Deployment: Deploy the infrastructure separately in the dev and prod workspaces.

#### Validation and Testing:

Apache Installation Verification: After the deployment, verify that Apache is installed and running on the EC2 instance by accessing the public IP address in a web browser.

Workspace Separation: Confirm that each workspace has its own isolated infrastructure and state files.

Provisioner Logs: Review the output from the local-exec provisioner to ensure it indicates successful deployment.

Resource Cleanup:

Destroy Resources: Use terraform destroy to remove the resources in both workspaces.

#### Snapshots:-

![alt text](<Screenshot from 2024-08-22 16-58-17.png>) 

![alt text](<Screenshot from 2024-08-22 17-23-17.png>) 

![alt text](<Screenshot from 2024-08-22 17-23-32.png>) 

![alt text](<Screenshot from 2024-08-22 17-23-52.png>) 

![alt text](<Screenshot from 2024-08-23 10-40-03.png>) 

![alt text](<Screenshot from 2024-08-23 10-40-25.png>) 

![alt text](<Screenshot from 2024-08-23 10-41-01.png>) 

![alt text](<Screenshot from 2024-08-23 10-41-39.png>)

![alt text](<Screenshot from 2024-08-22 17-44-17.png>)
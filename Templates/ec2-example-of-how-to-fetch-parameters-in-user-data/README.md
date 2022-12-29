# CloudFormation Template for EC2 Instance with PostgreSQL

This CloudFormation template creates an Amazon Elastic Compute Cloud (EC2) instance running Amazon Linux, with PostgreSQL installed and configured.

## Parameters

The template has the following parameters:

- `DBUsername`: The username for the database.
- `DBPassword`: The password for the database. This parameter has the `NoEcho` property set to `true`, which means that the value will not be displayed in the CloudFormation console.
- `AMI`: The AMI to use for the EC2 instance. The default value is the latest Amazon Linux AMI.

## Resources

The template creates the following resources:

- An EC2 instance with the specified AMI.
- An IAM role with the `AmazonEC2RoleforSSM` managed policy attached, which allows the EC2 instance to use the AWS Systems Manager (SSM) service.
- An IAM instance profile that is attached to the EC2 instance.

The EC2 instance is configured using cloud-init and the `UserData` property. The following actions are taken during the EC2 instance launch:

- The `amazon-linux-extras` package is installed.
- The `postgresql13` package is installed using `amazon-linux-extras`.
- The `DBUsername` and `DBPassword` variables are exported to the environment.
- The values of `DBUsername` and `DBPassword` are written to a file in the `/tmp` directory.

## Outputs

The template returns the following outputs:

- `EC2InstanceId`: The ID of the EC2 instance.
- `EC2PublicIP`: The public IP of the EC2 instance.

## Usage

To create a stack using this template, follow these steps:

1. Go to the [CloudFormation console](https://console.aws.amazon.com/cloudformation).
2. Click the "Create Stack" button.
3. Select "Upload a template file" and choose the template file from your local filesystem.
4. Specify the values for the parameters.
5. Click the "Create Stack" button to create the stack.

After the stack is created, you can view the output values in the CloudFormation console or retrieve them using the AWS CLI or SDKs.

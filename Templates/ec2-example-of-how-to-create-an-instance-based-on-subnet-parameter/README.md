# AWS CloudFormation Template for EC2 Instance

This AWS CloudFormation template is used to create an Amazon EC2 instance and an IAM role.

## Prerequisites

Before you can use this template, you will need to have the following:

- An AWS account
- An Amazon Machine Image (AMI) to use for the EC2 instance
- The ID of a subnet in your Virtual Private Cloud (VPC)

## Parameters

The following parameters can be specified when creating or updating the stack:

- `SubnetId`: The ID of the subnet that the EC2 instance will be launched in.
- `AMI`: The AMI to use for the EC2 instance.

## Resources

The following resources will be created when the stack is created or updated:

- An EC2 instance with the specified `AMI` and `SubnetId`.
- An IAM role with the necessary permissions to use the [AWS Systems Manager (SSM)](https://aws.amazon.com/systems-manager/).
- An IAM instance profile that is associated with the IAM role.

## Outputs

The following output value will be displayed after the stack is created or updated:

- `EC2InstanceId`: The ID of the EC2 instance that was created.

## Usage

To create a stack using this template, run the following command in the AWS CLI:

        aws cloudformation create-stack
            --stack-name <stack name>
            --template-body file://<path to template file>
            --parameters ParameterKey=SubnetId,ParameterValue=<subnet ID>
            ParameterKey=AMI,ParameterValue=<AMI ID>

To update an existing stack, run the following command in the AWS CLI:

        aws cloudformation update-stack
            --stack-name <stack name>
            --template-body file://<path to template file>
            --parameters ParameterKey=SubnetId,ParameterValue=<subnet ID>
            ParameterKey=AMI,ParameterValue=<AMI ID>




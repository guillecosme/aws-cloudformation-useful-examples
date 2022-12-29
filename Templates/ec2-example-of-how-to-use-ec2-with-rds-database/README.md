# CloudFormation Template example of how to use an EC2 Instance with RDS Database Table

This CloudFormation template creates an Amazon Elastic Compute Cloud (EC2) instance with the PostgreSQL database engine installed and connects the instance to an Amazon Relational Database Service (RDS) instance. The EC2 instance creates a table in the RDS database and inserts sample data.

## Parameters

The following parameters are required:

- `RDSDatabaseSchemaName`: The name of the database schema to create in RDS. (Default: `example_database`)
- `RDSInstanceEndpoint`: The endpoint of the RDS instance. (Default: `example-postgres-instance.c4ypbbmbnnpb.us-east-1.rds.amazonaws.com`)
- `DBUsername`: The username for the database.
- `DBPassword`: The password for the database.
- `AMI`: The Amazon Machine Image (AMI) to use for the EC2 instance. Default: `/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-ebs`.

The following parameter is optional:

- `AMI`: The Amazon Machine Image (AMI) to use for the EC2 instance. (Default: `/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-ebs`)

## Resources

The following resources are created:

- EC2 instance with the specified AMI and instance type t2.micro.
- IAM instance profile with an attached IAM role that has the AmazonEC2RoleforSSM managed policy.
- EC2 instance user data script that installs the PostgreSQL engine, exports the values of the `DBUsername`, `DBPassword`, `RDSInstanceEndpoint`, and RDSDatabaseSchemaName parameters as environment variables, and uses these variables to connect to the RDS instance and create a table called `example_table` in the specified database, and inserts sample data into the table.

## Ouputs

This template defines two output values: the ID of the EC2 instance and the public IP of the EC2 instance. These output values can be useful for reference in other parts of your CloudFormation stack or for displaying information about the resources created by the stack.

- `EC2InstanceId`: The ID of the EC2 instance.
- `EC2PublicIP`: The public IP of the EC2 instance.

## Usage

To use this template, you will need to provide the following:

1. The `DBUsername` and `DBPassword` parameters for the RDS database.
2. Optionally, you can customize the `RDSDatabaseSchemaName` and `RDSInstanceEndpoint` parameters to specify a different database name and RDS endpoint.
3. Optionally, you can customize the `AMI` parameter to specify a different AMI for the EC2 instance.

## Notes

- The NoEcho property is set to true for the DBPassword parameter to prevent the password from being displayed in the CloudFormation console or CLI output.
- The !Sub function is used in the UserData property to allow the use of variables in the script.
- The !Ref and !GetAtt functions are used in the output values to reference resources and resource attributes in the stack.

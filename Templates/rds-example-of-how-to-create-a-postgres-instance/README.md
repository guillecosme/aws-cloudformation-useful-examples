# Example of how to create a postgres RDS Instance

This CloudFormation template creates an Amazon Relational Database Service (RDS) instance running PostgreSQL, as well as an Amazon Elastic Compute Cloud (EC2) security group that allows incoming connections to the RDS instance on port 5432.

## Parameters

- `VpcId`: The ID of the Virtual Private Cloud (VPC) to launch the RDS instance in.
- `DbUsername`: The username for the database.
- `DbPassword`: The password for the database.

## Resources

- EC2 security group that allows incoming connections to the RDS instance on port 5432 from any IP address.
- RDS instance with the specified PostgreSQL engine and version, database name, and class. The RDS instance uses the specified username and password as the master username and password, and is launched in the specified VPC and availability zone with the security group applied to it.

## Outputs

- `DBInstanceIdentifier`: The identifier of the RDS instance. This output value is exported with the name `{AWS::StackName}-DBInstanceIdentifier` so that it can be referenced in other CloudFormation stacks.

## Usage

To use this template, you will need to provide the following:

1. The `VpcId` parameter to specify the ID of the VPC to launch the RDS instance in.
2. The `DbUsername` and `DbPassword` parameters to specify the username and password for the database, respectively.

## Notes

- The `NoEcho` property is set to `true` for the `DbPassword` parameter to prevent the password from being displayed in the CloudFormation console or CLI output.

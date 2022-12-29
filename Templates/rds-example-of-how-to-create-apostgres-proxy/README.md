## CloudFormation Template example of how to create a RDS Proxy and connect it to an existing RDS Instance


This CloudFormation template creates an Amazon RDS database proxy and a target group. The proxy authenticates and connects to the database specified in the `DBInstanceArn` parameter using an IAM role and a Secrets Manager secret. The target group specifies the database specified in the `RDSIdentifier` parameter as the target for the proxy.

## Parameters

The following parameters can be customized when creating the stack:

- `DBInstanceArn`: The ARN of the database. Default: `arn:aws:rds:us-east-1:692892377645:db:example-postgres-instance`
- `RDSIdentifier`: The identifier of the database to be used on the proxy target group. Default: `example-postgres-instance`
- `VpcSecurityGroupIds`: The IDs of the security group IDs to launch the RDS proxy in. Default: `sg-0a9843d9a68a44f55`
- `SubnetIds`: The IDs of the subnets to launch the RDS proxy in. At least two. Default: `subnet-77aec23a, subnet-6c66865d, subnet-00f52c5f`
- `DbUsername`: The username for the database. Default: `master`
- `DbPassword`: The password for the database. Default: `12345678`

## Resources

The following resources are created by this template:

- IAM role: Allows the Amazon RDS service to assume the role and access the database specified in the `DBInstanceArn` parameter.
- Secrets Manager secret: Stores the username and password for the database.
- Resource policy for Secrets Manager secret: Allows the IAM role created above to access the secret.
- Amazon RDS database proxy: Authenticates and connects to the database specified in the `DBInstanceArn` parameter using the IAM role and Secrets Manager secret created above.
- Target group for Amazon RDS database proxy: Specifies the database specified in the `RDSIdentifier` parameter as the target for the proxy.

## Usage

To create a stack using this template, follow the instructions in the AWS CloudFormation documentation. You can customize the parameters as needed when creating the stack.

## Note

Make sure to replace the default values for the parameters with your own values before creating the stack.

# Example of how to create a public and private subnets

This CloudFormation template creates a virtual private cloud (VPC) with one private and one public subnet. The VPC is a logically isolated section of the AWS Cloud where you can launch AWS resources in a virtual network that you define. A subnet is a range of IP addresses in your VPC. You can select its IP address range from your VPC's IP address range, and you can associate security groups and network ACLs with your subnet.

The private subnet does not have a route to the public internet, while the public subnet does have a route to the internet through an internet gateway. This allows you to launch resources that need to be connected to the internet (such as a web server) in the public subnet, and resources that should not be directly accessible from the internet (such as a database) in the private subnet.

The CIDR blocks for the VPC, private subnet, and public subnet are specified as template parameters, allowing you to customize the IP address range for each of these resources.

## Parameters

- `VpcCidr`: The CIDR block for the VPC. This parameter is of type `String`, and it specifies the range of IP addresses for the VPC. The CIDR block must be a valid IPv4 network range in CIDR notation, such as `10.0.0.0/16`.
- `PrivateSubnetCidr`: The CIDR block for the private subnet. This parameter is of type `String`, and it specifies the range of IP addresses for the private subnet. The CIDR block must be a valid IPv4 network range in CIDR notation, and it must be a subset of the VPC CIDR block. For example, if the VPC CIDR block is `10.0.0.0/16`, a valid CIDR block for the private subnet could be `10.0.1.0/24`.
- `PublicSubnetCidr`: The CIDR block for the public subnet. This parameter is of type `String`, and it specifies the range of IP addresses for the public subnet. The CIDR block must be a valid IPv4 network range in CIDR notation, and it must be a subset of the VPC CIDR block. For example, if the VPC CIDR block is `10.0.0.0/16`, a valid CIDR block for the public subnet could be `10.0.2.0/24`.


## Resources

- `Vpc`: An Amazon VPC with a CIDR block specified by the `VpcCidr` parameter. The VPC has DNS support and hostnames enabled.
- `InternetGateway`: An Internet Gateway, which is required to allow communication between the VPC and the internet.
- `VpcGatewayAttachment`: An attachment between the Internet Gateway and the VPC.
- `PrivateSubnet`: A private subnet with a CIDR block specified by the `PrivateSubnetCidr` parameter. The subnet is created in the first availability zone (AZ) available in the region. Instances launched in this subnet will not be automatically assigned a public IP address.
- `PublicSubnet`: A public subnet with a CIDR block specified by the `PublicSubnetCidr` parameter. The subnet is also created in the first availability zone available in the region. Instances launched in this subnet will be automatically assigned a public IP address.
- `PublicSubnetRouteTableAssociation`: An association between the public subnet and a route table.
- `PublicSubnetRouteTable`: A route table for the public subnet.
- `PublicSubnetRoute`: A route that allows all traffic (0.0.0.0/0) to be directed to the Internet Gateway.

## Outputs

- `VpcId`: The ID of the VPC.
- `PrivateSubnetId`: The ID of the private subnet.
- `PublicSubnetId`: The ID of the public subnet.

## Usage

To create the VPC, private subnet, and public subnet, specify the necessary parameter values and execute the following command:

```bash
aws cloudformation create-stack \
    --stack-name my-vpc \
    --template-body file://vpc.yaml \
    --parameters ParameterKey=VpcCidr,ParameterValue=10.0.0.0/16 \
                 ParameterKey=PrivateSubnetCidr,ParameterValue=10.0.1.0/24 \
                 ParameterKey=PublicSubnetCidr,ParameterValue=10.0.2.0/24


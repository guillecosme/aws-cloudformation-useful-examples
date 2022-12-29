## Type this in AWS CLoudShell to check the rds proxy availability

aws rds describe-db-proxy-targets --db-proxy-name example-db-proxy



## Expected response:

{
    "Targets": [
        {
            "Endpoint": "example-postgres-instance.c4ypbbmbnnpb.us-east-1.rds.amazonaws.com",
            "RdsResourceId": "example-postgres-instance",
            "Port": 5432,
            "Type": "RDS_INSTANCE",
            "Role": "READ_WRITE",
            "TargetHealth": {
                "State": "AVAILABLE"
            }
        }
    ]
}


## PENDING_PROXY_CAPACITY
{
    "Targets": [
        {
            "Endpoint": "example-postgres-instance.c4ypbbmbnnpb.us-east-1.rds.amazonaws.com",
            "RdsResourceId": "example-postgres-instance",
            "Port": 5432,
            "Type": "RDS_INSTANCE",
            "Role": "UNKNOWN",
            "TargetHealth": {
                "State": "UNAVAILABLE",
                "Reason": "PENDING_PROXY_CAPACITY",
                "Description": "DBProxy Target is waiting for proxy to scale to desired capacity"
            }
        }
    ]
}

## AUTH_FAILURE

{
    "Targets": [
        {
            "Endpoint": "example-postgres-instance.c4ypbbmbnnpb.us-east-1.rds.amazonaws.com",
            "RdsResourceId": "example-postgres-instance",
            "Port": 5432,
            "Type": "RDS_INSTANCE",
            "Role": "READ_WRITE",
            "TargetHealth": {
                "State": "UNAVAILABLE",
                "Reason": "AUTH_FAILURE",
                "Description": "Proxy does not have any registered credentials"
            }
        }
    ]
}

## Every proxy logs information on CLoudwatch Logs (there will be a specific log stream for the proxy)

## There you will probably find a resulta like this in case of auth error:

## Credentials couldn't be retrieved. 
## The IAM role "arn:aws:iam::xxxxxxxxxxxx:role/a-DBRole-1UIVUWLNJCO0S" 
## is not authorized to read the AWS Secrets Manager secret with the ARN "arn:aws:secretsmanager:us-east-1:xxxxxxxxxxxx:secret:example-db-secret-ZC4J3m"

## This is the policy you need to attach as a Resource POlicy to the secrets

{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::xxxxxxxxxxxx:role/root"
            },
            "Action": "secretsmanager:GetSecretValue",
            "Resource": "*"
        }
    ]
}


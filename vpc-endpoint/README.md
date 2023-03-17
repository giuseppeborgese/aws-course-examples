# VPC ENDPOINT DEMO
* choose a region
* show the role with full s3 access s3-full-access-for-vpc-endpoint-demo
* create in a vpc an s3 gateway endpoint (also assigne to the subnet)
* create a bucket in s3 in the same region you choose
* create an ec2
* login in the ec2 and load data
* show that it works from my laptop
* add the policy 
* still working from ec2, not anymore from my cli or console
* remove the route in the route table
* show it is not working
* if I delete an endpoint?
* if I recreate the endpoint?
* attention to the cache time for s3 ls and cp also 30 seconds 1 minute

policy copied from https://docs.aws.amazon.com/vpc/latest/privatelink/vpc-endpoints-s3.html#bucket-policies-s3 

```
{
  "Version": "2012-10-17",
  "Id": "Access-to-bucket-using-specific-endpoint",
  "Statement": [
    {
      "Sid": "Access-to-specific-VPCE-only",
      "Effect": "Deny",
      "Principal": "*",
      "Action": "s3:*",
      "Resource": ["arn:aws:s3:::test-sec-eng-course-giuseppe",
                   "arn:aws:s3:::test-sec-eng-course-giuseppe/*"],
      "Condition": {
        "StringNotEquals": {
          "aws:sourceVpce": "vpce-0b0ac47d0d2f7fdb6"
        }
      }
    }
  ]
}
```
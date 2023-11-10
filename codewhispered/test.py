#!/usr/bin/python3
import boto3

# how to list all my s3 buckets
    
s3 = boto3.resource('s3')
for bucket in s3.buckets.all():
    print(bucket.name)

# how to list all my ec2 instances
ec2 = boto3.resource('ec2')
for instance in ec2.instances.all():
    print(instance.id, instance.state)


    

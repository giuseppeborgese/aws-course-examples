#!/usr/bin/python3

import boto3

# can you list all my s3 buckets?
s3 = boto3.resource('s3')
for bucket in s3.buckets.all():
    print(bucket.name)

# can you list all my ec2 instances?
ec2 = boto3.resource('ec2')
for instance in ec2.instances.all():
    print(instance.id, instance.state)
    
# can you list all my rds instances?
rds = boto3.client('rds')
response = rds.describe_db_instances()
for db in response['DBInstances']:
    print(db['DBInstanceIdentifier'], db['DBInstanceStatus'])

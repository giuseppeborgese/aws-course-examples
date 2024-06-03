#!/usr/bin/python3
import boto3

#how to list all my ec2 instances
ec2 = boto3.resource('ec2')
for instance in ec2.instances.all():
    print(instance.id, instance.state)
    print(instance.public_ip_address)
    print(instance.tags)


    

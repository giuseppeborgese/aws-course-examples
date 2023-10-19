# How to create a spot instance in one command

* create a file with this content
```
cat spot-options.json
{
    "MarketType": "spot",
    "SpotOptions": {
        "SpotInstanceType": "persistent",
        "InstanceInterruptionBehavior": "stop"
    }
}
```

* run the following command, of course replace the subnet. security-groups, with your own
```
aws ec2 run-instances \
    --image-id ami-0b9fd8b55a6e3c9d5 \
    --instance-type "t3.micro" \
    --count 1 \
    --subnet-id subnet-0ed5ba484688d1849 \
    --security-group-ids sg-0989cdda36b3010ed \
    --instance-market-options file://spot-options.json \
    --region eu-west-1 \
    --associate-public-ip-address
```

* you cannot terminate as usual but you need to go to EC2 ==> Instances ==> Spot Requests and cancel the spot request
# DEMO  Spot with ec2autoscaling
* creare un launch template default thing, Amazon linux image, c3.large, show in the advanced details we are not using spot option
* create an autoscaling group, select the subnet, overwrite the launch template configuration, manually add instance types, 
* in the 90% spot request, 10% on demand, remove on demand base min 1, max 10, desideraded 10. Un-select the base for scaling
* check the spot request you will see 9 active, check the instance you will see 10
* delete the autoscaling group and the launch template

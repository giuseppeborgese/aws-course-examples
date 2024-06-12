# Balancer blue green deployment

## Network Load Balancer
* version 1 is working on port 80
* version 2 is working on port 8080
* I can gon the in listener and change version, after the change, it is necessary 1min 1min and 30seconds to see the new version
'''
NLB_URL=//demo-elb-routing-nlb-23d75c2475ca4ef9.elb.eu-central-1.amazonaws.com
for i in {1..300}; do curl $ALB_URL ;sleep 1; done
'''

## Aplication Load Balancer
* version 1 is working on port 80
* version 2 is working on port 8080
* after you have tested both, run the script below, replaing your ALB_URL
'''
ALB_URL=demo-elb-routing-alb-1411585164.eu-central-1.elb.amazonaws.com
for i in {1..300}; do curl $ALB_URL ;sleep 1; done
'''
* leave the script running
* go in the application loab balancer listerner port 80 and add a new target group balacing the weight 50% each one
* you need to wait around 15/30 seconds to see the change

# Application Load Balancer behind a Network load balancer
* create a target group with destination the application load balancer used before, call it alb-target-group
* go in the network load balancer listener port 80 and select the target group just created 
* run the script again and you will see the weight 50% 
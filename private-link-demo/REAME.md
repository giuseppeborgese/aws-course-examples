# AWS Private Link DEMO

we are implementing what is in this documentation page https://docs.aws.amazon.com/vpc/latest/privatelink/privatelink-share-your-services.html 

We have 2 accounts: 
* "Service Provider" account with ID 111111111111, where there is our SAAS product to share privately with
* "Service Consumer" account with ID 222222222222, where there is the customer that wants to use our product but with the private access

### in the "Service Provider"
* create a public service for example with ecs-demo folder
* create a target group that points to the ALB
* create a network load balancer private that points to that target group, before proceed to the next step you need to wait the balancer is in available state
* create in the VPC the "Service Endpoints" that uses that network load balancer
* go in the option of the new service endpoint and share it with the other account the pricipal for the account account
```
arn:aws:iam::222222222222:root
```
* copy in the endpoint service name, something similar to com.amazonaws.vpce.us-east-1.vpce-svc-05145930ff138f588

### in the "Service Consumer"
* go in the VPC ==> Endpoint and Create an Endpoint
* choose a name, select other
* in the Service Name paste the name you copied few steps above com.amazonaws.vpce.us-east-1.vpce-svc-05145930ff138f588 and click on verify service
* select AZ, subnet, and a security group, in our case the security groups needs to have the port 80 open 

### in the "Service Provider"
* go back to the endpoint services, select your endpoint and in the tab <<endpoint connections>> accept the request
* these acceptance will require some minutes, after 1 or 2 minutes refresh and you will see that it is available

### in the "Service Consumer"
* you can copy the DNS names (NOT the service endpoint) from the endpoint and use it inside a machine to test

Remember to destroy everything when you finish to avoid incuring in charges
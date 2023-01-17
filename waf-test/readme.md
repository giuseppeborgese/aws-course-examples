Run terraform plan and apply on this directory. This will create a ALB and associate a waf 
rule with max 100 requests from the same ip in 5 minutes.

To test you can use this code, replace the dns for your balancer

```
for i in {1..500}; do curl fixed-response-465564568.eu-west-1.elb.amazonaws.com; done
```

if you use the option -I in curl you will see the response code only and not the html


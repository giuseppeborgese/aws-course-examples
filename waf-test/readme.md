Run terraform plan and apply on this directory. This will create a ALB and associate a waf 
rule with max 100 requests from the same ip in 5 minutes.

# Testing

To test you can use this code, replace the dns for your balancer

```
for i in {1..500}; do curl fixed-response-465564568.eu-west-1.elb.amazonaws.com; done
```

if you use the option -I in curl you will see the response code only and not the html

# Some Rules for Cloudwatcht insights

it prints the first 100 requests that were blocked
```
fields @timestamp, httpRequest.clientIp, terminatingRuleId, httpRequest.country, @message
| filter action ='BLOCK'
| sort @timestamp desc
| limit 100
```

count how many http calls were blocked by each ip and put at side the nactionality
```
fields httpRequest.clientIp
| stats count(*) as requestCount by httpRequest.clientIp, httpRequest.country
| sort requestCount desc
| filter action ='BLOCK'
| limit 100
```

You can find other rules example on the post https://aws.amazon.com/it/blogs/mt/analyzing-aws-waf-logs-in-amazon-cloudwatch-logs/ 

# Some Query for SQL Injecto and XSS
If you are using the managed rules AWS-AWSManagedRulesSQLiRuleSet and AWS-AWSManagedRulesCommonRuleSet the following kinds of attacks will be blocked

### URL example
Any query with in the URL something like this
```
mywebsits.com/search?q=' or 1=1 --
```
the part that block the thing is ' or 1=1 --

### Payload example 1
if in your payload you have something like this
```
{"email":"' or 1=1 --","password":"123"}
```
the same content but you see this time is inside the content

### Payload example 2
a piece of javascript inside the content of the payload
```
{"email":"<iframe src=\"javascript:alert(`xss`)\">","password":"123456","passwordRepeat":"123456"}
```



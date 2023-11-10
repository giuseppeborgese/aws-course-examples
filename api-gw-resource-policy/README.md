# Use a resource policy for an API GW

* In your REST API GW, choose the resource policy and put the following one
* Don't forget to replace your ip address and do the deploy (because in the REST API the deploy is not automatic)
* all the others IP will be denied and only the one you select will work.
* keep in mind that the wizard will change this policy addind the resoure name of your api API GW

```
{
  "Version": "2012-10-17",
  "Statement": [{
      "Effect": "Allow",
      "Principal": "*",
      "Action": "execute-api:Invoke",
      "Resource": "execute-api:/*/*/*"
    },
    {
      "Effect": "Deny",
      "Principal": "*",
      "Action": "execute-api:Invoke",
      "Resource": "execute-api:/*/*/*",
      "Condition": {
        "NotIpAddress": {
          "aws:SourceIp": ["<<replace your ip>>/32"]
        }
      }
    }
  ]
}
```

* you can extract the IP address of your cloudshell with the following 
```
curl ifconfig.me
```
* prove that it work only from that ip and not from your home/office anymore
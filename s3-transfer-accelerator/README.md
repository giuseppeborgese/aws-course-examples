to do a short demo on this:

* chose a bucket in a supported region like ireland
* shows that transfer accelerator is disabled
* try the command and shows the error
```
aws s3 cp AWS.jpeg s3://demo-s3-object-lambda --endpoint-url https://s3-accelerate.amazonaws.com
```
* enable the transfer accelerator from console
* run the command again to show that it is working

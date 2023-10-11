# Steps for the s3 access point demo
the reference page is https://docs.aws.amazon.com/AmazonS3/latest/userguide/access-points-policies.html#access-points-delegating-control 

* choose a bucket in my case I choose the poste bucket and put the bucket policy like this one
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "*"
            },
            "Action": "*",
            "Resource": [
                "arn:aws:s3:::<<bucket-name>",
                "arn:aws:s3:::<<bucket-name>/*"
            ],
            "Condition": {
                "StringEquals": {
                    "s3:DataAccessPointAccount": "<<AWS account number 12 digits>"
                }
            }
        }
    ]
}
```
* now the access policy has permission to operate
* go in the bucket and create a folder, I called "ap1"
* create an iam user to perform the testing using the following policy that give listing permissions, copy its arn for the policy
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:GetAccessPoint",
                "s3:ListAllMyBuckets",
                "s3:ListAccessPoints",
                "s3:ListBucket",
                "s3:ListMultiRegionAccessPoints"
            ],
            "Resource": "*"
        }
    ]
}
```
* create the access point inside the bucket choose a name I choose "ap1-name"
* for this access point setup the bucket policy like this one, replace ap1 and ap1-name with others if you choose different ones
```
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Effect": "Allow",
			"Principal": {
				"AWS": "<<iam user arn>"
			},
            "Action": [
                "s3:GetObject", 
                "s3:PutObject"
            ],
			"Resource": "arn:aws:s3:<<bucket region code>:<<AWS account number 12 digits>:accesspoint/ap1-name/object/ap1/*"
		}
	]
}
```
* go inside s3 ==> Access point ==> ap1-name ==> ap1 , click on properties and copy the s3 uri, in my case was s3://arn:aws:s3:eu-west-1:790419456202:accesspoint/ap1-name/ap1/
* you can login as the iam user and test upload download, the lising option is given from the Identity policy and not from the access point policy
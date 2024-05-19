# Test the Function URL IAM Authentication

* I took this demo from this italia article, you can find also screenshort there https://blog.devandreacarratta.it/aws-lambda-function-urls-iam/?utm_source=linkedin&utm_medium=cloud-development&utm_campaign=aws&utm_content=aws-lambda-function-urls-iam

* create a lambda function, save the lambda function arn
* enable function url with AWS_IAM_AUTH_PARAMETER
* try to run a get with the function url you will have message forbidden
* create an iam user (or a role to assume), for a quick demo we can do with IAM user
* create a policy for the iam user or role like this one
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "lambda:InvokeFunctionUrl"
            ],
            "Resource": "<<REPLACE THE ARN OF YOUR LAMBDA FUNCTION>>"
        }
    ]
}
```
* create iam credentials authentication and secret keys
* use postman or curl (my favourite)
* if you use curl here a bash you need only to replace the environment variables
```
AWS_ACCESS_KEY_ID=xxxxxxxxxx
AWS_SECRET_ACCESS_KEY=xxxxxxxxxxxxxxxx
AWS_DEFAULT_REGION=eu-west-1
FUNC_URL='https://somethinghere.lambda-url.eu-west-1.on.aws/'

curl --request GET \
  ${FUNC_URL} \
  --aws-sigv4 aws:amz:${AWS_DEFAULT_REGION}:lambda \
  --user "${AWS_ACCESS_KEY_ID}:${AWS_SECRET_ACCESS_KEY}" \
  --header 'Accept: application/json'
```

* if you use the role you need to add this header as well
```
  --header "x-amz-security-token: ${AWS_SESSION_TOKEN}" \
```
* if you want he postman instructions look at the screeshot in the article above
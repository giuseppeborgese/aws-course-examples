every upload on s3 simple lambda write info on dynamodb

* create an s3 bucket demo-lambda-write-info-on-dynamo
* create a dynamodb with primary key called "key"
* creata a lambda with default python3.9 and add the dynamodb full access to the role
* connect the lambda to s3 trigger for put 

# Localstack
it is becoming a very import product and it is worth to mention

## Installation
There the open-source free version on github here https://github.com/localstack/localstack?tab=readme-ov-file

* install docker on your mac
* I installed with the pip method
```
python3 -m pip install localstack
```

## Start
* be sure docker is up and running
* run localstack 
```
localstack start -d
```

## Run commands
Using the same cli only changing the endpoint

### DynamoDB
```
aws dynamodb list-tables --endpoint-url http://localhost:4566
```

### S3
```
aws s3 mb s3://test --endpoint-url http://localhost:4566
aws s3 ls --endpoint-url http://localhost:4566
```

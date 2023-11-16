# API GW direct access DynmoDB 

* in this way the API GW calls directly the DynamoDB and saves lambda cost

* I used this repo https://github.com/aws-samples/serverless-patterns/tree/main/apigw-rest-api-dynamodb but I have to do some changes

* after the clone the command to run is this one, the one provided in the documention is not working
```
sam deploy --stack-name apidyn --capabilities CAPABILITY_IAM CAPABILITY_AUTO_EXPAND CAPABILITY_NAMED_IAM
```
* after you can recover the api gw endpoint add the /music but also you need to go in the api gw console and find the api key then you can compose the following queries. For me it is easier with curl than postman
* my post requests to insert 
```
curl -X POST https://2e0485lvhh.execute-api.eu-south-1.amazonaws.com/v1/music  --header 'x-api-key: S5TrKrlxyS59omBf90S1W3UeqKNMlMzfagzNvEBe'  -H 'Content-Type: application/json' -d '{"artist":"The Beatles","album": "peppe "}'
```
* to get 
```
curl -X GET https://2e0485lvhh.execute-api.eu-south-1.amazonaws.com/v1/music/The+Beatles  --header 'x-api-key: S5TrKrlxyS59omBf90S1W3UeqKNMlMzfagzNvEBe'
```
* don't forget to delete the stack at the end
```
sam delete --stack-name apidyn
```
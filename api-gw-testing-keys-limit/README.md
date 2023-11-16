# Testing key limits

* The issue here is that every time you modify the keys the changes needs 5/10 minutes to propagates. So you need to test in advance. There is no way to read at least from the console when this think is ready
* create a lambda function
* create a rest api with key protection
* goes in this key quota and enable rate limit and burst to 1
* the message for the throttle is
```
{"message":"Too Many Requests"}
```
* run the script in 2 terminals
```
for i in {1..110}; do curl --request GET https://<<api gw methos>>  --header 'x-api-key: <<key limit>'; echo "\n"; done;
```
* the connection is always: API-GW ==> Stage ==> Usage plans ==> API-KEY
* to prove it is working you can have another key without limitation
* I setup this in north virginia also for daily quota and it is working. The issue I had was on the 
* The message for quote exeed is 
```
{"message":"Limit Exceeded"}
```
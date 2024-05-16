# SQS and Lambda errors with dead letter queue

* Create a lambda python 3.12 with the default permission and role, call it consumer
* Just add the code in this directory, set the timeout to 20 seconds, and to the role the AWSLambdaSQSQueueExecutionRole
* goes on sqs and create a queue standard, called main with all the default
* in the lambda trigger add the sqs with batch size 1
* send the first message in the queue, the message body needs to be a number below 6, only the number otherwise the code will fail
* in the main page of all the queues refresh to see the 1 message in flight, keep in mind that can be 0 or 1 depends from the refresh but after 10 seconds should be always 0
* check the logs to see if the message was correctly processed 
* send a new message in the queue above 5
* checks the cloudwatch logs you will see a lot of errors, this is the purpose of the code fails intentionally with messagges above 5.
* there are a lot of lambda errors and the system is stuck on this number, lets fix it
* goes in the queues and create a new queue called dead-letter, Redrive allow policy = enable, so all the queues can put messages here
* edit the main queue and enable the dead letter queue option with the new queue just created, choose Max receives to 1
* goes to the main queues page and after some refresh see that the message is passed to the dead letter queue 


### next steps evolutions for this demo
* increase the batch size and send more messages with the delay
* see on_failure destination
* partial deletion of a batch of messagges 
* differences in queue refresh page with FIFO

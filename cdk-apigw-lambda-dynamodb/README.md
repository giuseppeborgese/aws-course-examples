# CDK 
Create a Cloud Environment with a t3 medium, we need ram for this

* install the latest version for npm
```
npm install -g npm
```
* install the cdk library
```
npm install aws-cdk-lib
```
* create the app directory
```
mkdir myapp
cd myapp
```
* inizialize the environment
```
cdk init app --language typescript
```
* prepare the region to work cdk
```
cdk bootstrap
```
* install sw dependencties
```
npm install -D aws-sdk
npm install -D aws-xray-sdk
npm install -D @types/aws-lambda
```
* the last one is to write lambda using the typescript language, I took this code from this public file https://github.com/DavidBlocher/cdk-lab-1/blob/main/lib/first-cdk-app-stack.ts 
* inside lib there is the file myapp-stack.ts 
* put inside the first piece of code 
```
    const dynamodb_table = new dynamodb.Table(this, "Table", {
      partitionKey: { name: "id", type: dynamodb.AttributeType.STRING },
      removalPolicy: RemovalPolicy.DESTROY
      }
    )
```
* you see you have errors because something is missing, so add the dependency on top
```
import * as dynamodb from 'aws-cdk-lib/aws-dynamodb'
import { RemovalPolicy, Stack, StackProps } from 'aws-cdk-lib';
```
* since I have imported the Stack and StackProps, I can remove the cdk. from line 7 and 8
* we need a lambda function
* put this ater the dynamodb
```
    //define lambda function and regeference function file
    const lambda_backend = new NodejsFunction(this, "function", {
      tracing: lambda.Tracing.ACTIVE,
      environment: {
        DYNAMODB: dynamodb_table.tableName
      },
    })
```
* to have this working you need to add 2 libs
```
import * as lambda from 'aws-cdk-lib/aws-lambda'
import { NodejsFunction } from 'aws-cdk-lib/aws-lambda-nodejs';
```
* we need to give lambda permissions to read the dynamodbtable
```
    //grant lambda function read access to dynamodb table
    dynamodb_table.grantReadData(lambda_backend.role!)
``` 
* now it is the moment to insert the API GW
```
    //define apigateway
    const api = new apigateway.RestApi(this, "RestAPI", {
      deployOptions: {
        dataTraceEnabled: true,
        tracingEnabled: true
      },
    })
```
* and of course we need to add the library
```
import { LambdaRestApi } from 'aws-cdk-lib/aws-apigateway';
import * as apigateway from 'aws-cdk-lib/aws-apigateway'
```
* the red circle can be only warning, you can push over to disable
* create a file in the same directory called like the file you are working on but with .function before the extension in my case is myapp-stack.function.ts this because at line 22 there is the word function as parameter
* for the content of the file put what it is here https://github.com/DavidBlocher/cdk-lab-1/blob/main/lib/first-cdk-app-stack.function.ts this will read the dynamodb table 
* run the check commands to see if everything is alright
```
cdk synth 
```
* after the deploy
```
cdk deploy
```
* you have the endpoint url you can test with curl but add the /scan at the end to catch the method
* take a look to the 3 resources created and after destroy everything with the command
```
cdk destroy
```
* after cdk destroy job is completed don't forget to destroy the cloud9


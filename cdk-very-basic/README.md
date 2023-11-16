# CDK Demo 

* create a cloud9 environment all default
* follow the link here https://docs.aws.amazon.com/cdk/v2/guide/getting_started.html
* install the pythong lib
```
python -m pip install aws-cdk-lib
npm install -g aws-cdk
```
* create an empty dir for example peppe cd in it
```
mkdir peppe
cd peppe
```
* initialize the project, app is a basic example template
```
cdk init app --language python 
```
* look inside the peppe directory file peppe_stack.py and un-comment all the code lines
* run the check command
```
cdk synth
```
* we can see the cloudformation code produced for the queue 
* before the run we need to run the environment preparation
```
cdk bootstrap
```
* now you have a stack in cloudformation with name CDKToolkit
* we can deploy
```
cdk deploy
```
* now you have in cloudformation a stack for this app 
* it is the moment to destroy
```
cdk destroy
```
* keep in mind that the bootstrap stack will remain
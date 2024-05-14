Sto usando le istruzioni https://docs.aws.amazon.com/cdk/latest/guide/hello_world.html

login in cloudshell (it doesn't work with the role of IAM SSO, use IAM user)

se cdk non installato

```bash
sudo npm install -g aws-cdk
```

start it
```bash
mkdir hello-cdk
cd hello-cdk
cdk init app --language python
source .venv/bin/activate
python -m pip install -r requirements.txt
cdk ls
```
* you should see the stack

* edit the file
```bash
nano hello_cdk/hello_cdk_stack.py
```
modify the file using this information
```python
from aws_cdk import aws_s3 as s3 #this goes on top with the other from

bucket = s3.Bucket(self, "MyFirstBucket", versioned=True,) #this goes inside the __init__ method
#keep in mind MyFirstBucket is the logical name inside cloudformation not the bucket name
```

test the code
```bash
cdk synth
```
notice there is not bucket name but instead you can find the version enable and the retion policy

show the CF template in the console

if you are running for the first time
```bash
cdk bootstrap aws://ACCOUNT-NUMBER/REGION 
#replace ACCOUNT-NUMBER with your 12 digits account and REGION with your current region
```
this is a CF template that it is already there

```bash
cdk deploy
```
finally destroy

```bash
cdk destroy
```

if you want to have everything clean to do the demo from scratch:
* open the stack CDKToolkit and find in the resources the bucket, open in a new tab
* delete the  cloudformation stack created from the bootstrap 
* as you can see the bucket was left there, empty the bucket
* delete the bucket
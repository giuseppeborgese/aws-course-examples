Sto usando le istruzioni https://docs.aws.amazon.com/cdk/latest/guide/hello_world.html

login in cloudshell

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
you should see the stack

```bash
pip install aws-cdk.aws-s3
```

edit the file
```bash
hello_cdk/hello_cdk_stack.py
```
add the import on top and the bucket definition inside the method
the 2nd property is not the bucket name but it will be in the bucket name
```python
from aws_cdk import aws_s3 as s3

bucket = s3.Bucket(self, "MyFirstBucket", versioned=True,)
```

test the
```bash
cdk synth
```
notice there is not bucket name but instead you can find the version enable and the retion policy

show the CF template in the console

modify the object adding this to the properties
```python
removal_policy=core.RemovalPolicy.DESTROY,auto_delete_objects=True
```

if you are running for the first time
```bash
cdk bootstrap aws://ACCOUNT-NUMBER/REGION Account
```
this is a CF template that it is already there

```bash
cdk deploy
```
finally destroy

```bash
cdk destroy
```

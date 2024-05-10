# Customer provided key with KMS

I took this example from the link https://blog.plerion.com/s3-bucket-encryption-doesnt-work-the-way-you-think-it-works/

creating a file set bucket name
```
cd /tmp
echo "hello world" >> myfile.txt
#this is a way to se a variable name with fish
set BUCK_NAME "poste"
#if you use bash run export BUCK_NAME="poste"
```

upload a file using a simple key in the command line
```
aws s3 cp ./myfile.txt s3://$BUCK_NAME/myfile.txt --sse-c AES256  --sse-c-key 12345678901234567890123456789012 
```
* try to visualize from the console, you cannot download from the console, you see error at key level.
* but you can visualize the metadata

also from the cli without providing the key
```
aws s3api head-object --bucket $BUCK_NAME --key myfile.txt
aws s3 cp s3://$BUCK_NAME/myfile.txt .
```

if I provide a wrong key of course doesn't work
```
aws s3 cp s3://$BUCK_NAME/myfile.txt ./myfile.txt --sse-c AES256 --sse-c-key 00000000000000000000000000000000
```
with the correct key works
```
aws s3 cp s3://$BUCK_NAME/myfile.txt ./myfile.txt --sse-c AES256 --sse-c-key 12345678901234567890123456789012
```

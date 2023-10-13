# S3 select how to reproduce the demo.
I'm using a csv rds price list, the s3 select works if you have data structured

* you need a valid credential on your account
* with this command you can obtain a link to download the file
```
aws pricing get-price-list-file-url --price-list-arn arn:aws:pricing:::price-list/aws/AmazonRDS/USD/20230328234721/us-east-1 --file-format csv --region us-east-1
```
* remove with nano or vi the first 4/5 lines to clean a little bit from uselss information
* rename the file I don't like index.csv I called rdspricing.csv 
* upload in a bucket, for me the bucket name is poste
* you can run queries now, look below example results in output.csv
* give me the first 10 lines
```
aws s3api select-object-content \
    --bucket poste \
    --key rdspricing.csv \
    --expression "select * from s3object limit 10" \
    --expression-type 'SQL' \
    --input-serialization '{"CSV": {}, "CompressionType": "NONE"}' \
    --output-serialization '{"CSV": {}}' "output.csv"
```
* count the row
```
aws s3api select-object-content \
    --bucket poste \
    --key rdspricing.csv \
    --expression "select count(0) from s3object" \
    --expression-type 'SQL' \
    --input-serialization '{"CSV": {}, "CompressionType": "NONE"}' \
    --output-serialization '{"CSV": {}}' "output.csv"
```
* select the first 2 colums
```
 aws s3api select-object-content \
    --bucket poste \
    --key rdspricing.csv \
    --expression "select _1, _2 from s3object limit 10" \
    --expression-type 'SQL' \
    --input-serialization '{"CSV": {}, "CompressionType": "NONE"}' \
    --output-serialization '{"CSV": {}}' "output.csv"
```
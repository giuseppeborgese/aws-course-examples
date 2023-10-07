import boto3
import csv

# Initialize an S3 client
s3 = boto3.client('s3')

# Specify the S3 bucket and prefix (folder) you want to list
bucket_name = 'borsoft.ch'

# List objects in the specified bucket and prefix
objects = s3.list_objects_v2(Bucket=bucket_name)

# Extract the object keys (file names)
object_keys = [obj['Key'] for obj in objects.get('Contents', [])]

# Create and write the object keys with bucket name to a CSV file
with open('list.csv', 'w', newline='') as csvfile:
    writer = csv.writer(csvfile)
    for object_key in object_keys:
        writer.writerow([bucket_name, object_key])

print(f'Object keys listed and saved to list.csv')

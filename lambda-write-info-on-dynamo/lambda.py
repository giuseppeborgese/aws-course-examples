import json
import boto3

def lambda_handler(event, context):
    upload_ipaddress = event['Records'][0]['requestParameters']['sourceIPAddress']
    obj_key = event['Records'][0]['s3']['object']['key']
    obj_size = event['Records'][0]['s3']['object']['size']

    client = boto3.client('dynamodb')
    put_item = client.put_item(
        TableName='demo-lambda-write-info-on-dynamo',
        Item={
            'key':{'S': obj_key} ,
            'size':{ 'S' : str(obj_size)},
            'ip':{ 'S' : upload_ipaddress}
        }
    )

    return {
        'statusCode': 200,
        'body': json.dumps('Hello from Lambda!')
    }

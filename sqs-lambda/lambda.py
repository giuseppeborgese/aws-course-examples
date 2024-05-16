import json
import sys
import time

def lambda_handler(event, context):
    print(json.dumps(event['Records'][0]['body']))
    value = int(event['Records'][0]['body'])
    if value > 5:
        sys.exit(1)
    else:
        time.sleep(10)
    return {
        'statusCode': 200,
        'body': json.dumps('run completed without ')
    }

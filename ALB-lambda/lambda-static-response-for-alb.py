import json

def lambda_handler(event, context):
    print("ciao mondo")
    return {
        "statusCode": 200,
        "statusDescription": "200 OK",
        "isBase64Encoded": False,
        "headers": {
            "Content-Type": "text/html"
        },
        "body": "<h1>ciao mondo from Lambda!</h1>"
    }
    

import boto3
import json
import uuid

dynamodb = boto3.resource("dynamodb")
table = dynamodb.Table("Cars-SAM")


def lambda_handler(event, context):
    payload = json.loads(event["body"])
    headers = {
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Headers": "*",
    }



    table.put_item(Item={
        "Cars_id": "CAR#{}".format(str(uuid.uuid1())),
        "Cars_brand": payload["Cars_brand"],
        "Cars_model": payload["Cars_model"],
        "Cars_year": payload["Cars_year"] 

    })

    return {
        "statusCode": 200, 
        'headers': headers,
        "body": "OK"
    }
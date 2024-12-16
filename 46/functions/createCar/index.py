import json
import os
import uuid

import boto3

# Determine AWS environment
aws_environment = os.environ.get("AWS_SAM_LOCAL")
if aws_environment == "true":
    dynamodb = boto3.resource("dynamodb", endpoint_url="http://host.docker.internal:8000")
else:
    dynamodb = boto3.resource("dynamodb")

table = dynamodb.Table("Cars-SAM")


def lambda_handler(event, context):
    """
    Lambda function to handle car data.
    """
    headers = {
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Headers": "*",
    }

    try:
        # Parse the payload
        payload = json.loads(event.get("body", "{}"))
        required_keys = ["Cars_brand", "Cars_model", "Cars_year"]
        if not all(key in payload for key in required_keys):
            return {
                "statusCode": 400,
                "headers": headers,
                "body": json.dumps({"error": "Missing required fields"}),
            }

        # Insert item into the DynamoDB table
        table.put_item(
            Item={
                "Cars_id": f"CAR#{str(uuid.uuid1())}",
                "Cars_brand": payload["Cars_brand"],
                "Cars_model": payload["Cars_model"],
                "Cars_year": payload["Cars_year"],
            }
        )

        return {
            "statusCode": 200,
            "headers": headers,
            "body": json.dumps({"message": "Item added successfully"}),
        }

    except json.JSONDecodeError:
        return {
            "statusCode": 400,
            "headers": headers,
            "body": json.dumps({"error": "Invalid JSON format"}),
        }

    except Exception as e:
        return {
            "statusCode": 500,
            "headers": headers,
            "body": json.dumps({"error": str(e)}),
        }

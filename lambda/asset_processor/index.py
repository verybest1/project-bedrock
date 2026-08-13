import json

def handler(event, context):
    print("Received event: " + json.dumps(event, indent=2))
    
    for record in event.get('Records', []):
        bucket = record['s3']['bucket']['name']
        key = record['s3']['object']['key']
        print(f"File uploaded: {key} in bucket {bucket}")
        
    return {
        'statusCode': 200,
        'body': json.dumps('Asset processed successfully')
    }
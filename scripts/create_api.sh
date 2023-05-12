awslocal lambda create-event-source-mapping --function-name worker --event-source-arn arn:aws:sqs:us-east-1:000000000000:requestQueue
awslocal apigateway create-rest-api --name 'Demo'
awslocal apigateway get-rest-apis
apiID=$(awslocal apigateway get-rest-apis | jq -r '.items[] | select(.name="local-localstack-demo") | .id')
export apiID
parentID=$(awslocal apigateway get-resources --rest-api-id $apiID | jq -r '.items[] | .id')
resourceID=$(awslocal apigateway create-resource --rest-api-id $apiID --parent-id $parentID --path-part requests | jq -r '.id')
awslocal apigateway put-method --rest-api-id $apiID --resource-id $resourceID --http-method POST --authorization-type "NONE"
awslocal apigateway put-integration --rest-api-id $apiID --resource-id $resourceID --http-method POST --type AWS_PROXY --integration-http-method POST --uri arn:aws:apigateway:us-east-1:lambda:path/2015-03-31/functions/arn:aws:lambda:us-east-1:000000000000:function:app/invocations --credentials arn:aws:iam::000000000000:role/apiRole
awslocal apigateway create-deployment --rest-api-id $apiID --stage-name local
echo "apiID=$apiID" >> "$GITHUB_ENV"

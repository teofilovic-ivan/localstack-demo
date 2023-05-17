sleep 40s
requestID=$(curl -s -d '{}' http://$apiID.execute-api.localhost.localstack.cloud:4566/local/requests | jq -r .requestID)
for i in 1 2 3 4 5 6 7 8 9 10; 
do 
    echo "Polling for processing result to appear in s3://archive-bucket/..."; 
    awslocal s3 ls s3://archive-bucket/ | grep $requestID && break; 
    sleep 5; 
done
awslocal dynamodb scan --table-name appRequests --select "COUNT" | jq -r .Count

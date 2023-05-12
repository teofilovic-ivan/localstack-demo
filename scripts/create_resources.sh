awslocal dynamodb create-table --cli-input-json file://table.json
awslocal sqs create-queue --queue-name requestQueue
awslocal s3api create-bucket --bucket archive-bucket
awslocal stepfunctions create-state-machine --name processingStateMachine --role-arn arn:aws:iam::000000000000:role/state-machines --cli-input-json file://state.json

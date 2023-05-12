awslocal lambda create-function --function-name app --handler app.handleRequest --runtime nodejs14.x --zip-file fileb://demo/lambdas/app.zip --role arn:aws:iam::000000000000:role/lambdas
awslocal lambda create-function --function-name worker --handler worker.triggerProcessing --runtime ruby2.7 --zip-file fileb://demo/lambdas/worker.zip --role arn:aws:iam::000000000000:role/lambdas --environment "Variables={STATE_MACHINE_ARN=arn:aws:states:us-east-1:000000000000:stateMachine:processingStateMachine}"
awslocal lambda create-function --function-name processing --handler processing.handle_request --runtime python3.7 --zip-file fileb://demo/lambdas/processing.zip --role arn:aws:iam::000000000000:role/lambdas --timeout 20
awslocal lambda create-function --function-name archiving --handler processing.archive_result --runtime python3.7 --zip-file fileb://demo/lambdas/processing.zip --role arn:aws:iam::000000000000:role/lambdas --environment "Variables={ARCHIVE_BUCKET=archive-bucket}" --timeout 20

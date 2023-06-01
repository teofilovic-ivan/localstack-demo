# LocalStack Demo

Simple demo application deployed using LocalStack.

The sample app illustrates a typical Web application scenario with asynchronous request processing happening in the background, all running locally inside LocalStack. The figure below outlines the application architecture with the different components and services involved in processing the requests.

<img src="demo/web/architecture.png" style="width: 600px" />

The application consists of SQS, DynamoDB, S3 bucket, Step Functions and four Lamdba functions: application, request worker, processing and archiving. 
The typical workflow follows these steps:
1. the user sends a POST request on *http://$apiID.execute-api.localhost.localstack.cloud:4566/local/requests*
2. **Application Lambda** handles the request and sends it with the status queued to the **SQS Request Queue** and **DynamoDB table** 
3. When the request is present in the **SQS Request Queue**, the **Worker Lambda** is invoked, which then initiates the execution of the **State Machine**
4. the **State Machine** sets up the workflow which starts with the **Processing Lambda** 
5. **Processing Lambda** records the request in the **DynamoDB table** with the status processing and processes the request
6. Following the completion of the **Processing Lambda**, the **Archiving Lambda** is invoked, which adds the request to the **DynamoDB table** with the status finished and places it in the **S3 bucket**

## Integration Test

The test.sh script in the scripts folder performs an integration test by sending a post request to *http://$apiID.execute-api.localhost.localstack.cloud:4566/local/requests*. The test is considered to be successful if there are three items in DynamoDB - one for each request status (queued, processing, finshed).

## Usage

To test the application go to *Actions*, select *ci* from a list of workflows and click *Run workflow*. Once the workflow is finished request should appear in the s3 bucket in the Test app step. Also, test.sh script tests if three different items per request are present in DynamoDB (one for each request status). If that is not the case the workflow fails.

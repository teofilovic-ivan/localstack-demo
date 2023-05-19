# LocalStack Demo

Simple demo application deployed using LocalStack.

The sample app illustrates a typical Web application scenario with asynchronous request processing happening in the background, all running locally inside LocalStack. The figure below outlines the application architecture with the different components and services involved in processing the requests.

<img src="demo/web/architecture.png" style="width: 600px" />

## Usage

To test the application go to Actions, select complete_workflow from a list of workflows and click Run workflow. Once the workflow is finished request should appear in the s3 bucket in the Test app step. Also, test.sh script tests if three different items per request are present in DynamoDB (one for each request status). If that is not the case the workflow fails.

## License

This code is available under the Apache 2.0 license.

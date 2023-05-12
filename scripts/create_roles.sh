awslocal iam create-role --role-name lambdas --assume-role-policy-document file://roles.json
awslocal iam create-role --role-name state-machines --assume-role-policy-document file://state_machine.json
awslocal iam create-role --role-name apiRole --assume-role-policy-document file://api_role.json
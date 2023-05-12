awslocal iam create-role --role-name lambdas --assume-role-policy-document file://config/roles.json
awslocal iam create-role --role-name state-machines --assume-role-policy-document file://config/state_machine.json
awslocal iam create-role --role-name apiRole --assume-role-policy-document file://config/api_role.json

find . -name "cdk.context.json" -exec rm -f {} \;

echo "[1/5] Deploy vpc"
cd ./vpc
cdk deploy --require-approval never

echo "[2/5] Deploy ecs-devops-cluster"
cd ../ecs-devops-cluster
cdk deploy --require-approval never

echo "[3/5] Deploy ecs-iam-role"
cd ../ecs-iam-role
cdk deploy --require-approval never

echo "[4/5] Deploy ecr-codecommit"
cd ../ecr-codecommit
cdk deploy --require-approval never

echo "[5/5] Deploy ecs-jenkins-service"
cd ../ecs-jenkins-service
cdk deploy --outputs-file ./cdk-outputs.json --require-approval never
cat ./cdk-outputs.json | jq .
echo 'Connect to ALB URL!'
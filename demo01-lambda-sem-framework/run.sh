# 1o passo - Criar arquivo de políticas de segurança

# Arquivo politicas.json

# 2o passo - Criar role de segurança na AWS

aws iam create-role \
  --role-name lambda-exemplo \
  --assume-role-policy-document file://politicas.json \
  | tee logs/role.log

# 3o passo - Criar arquivo com o conteúdo, zipá-lo e criar a lambda

zip function.zip index.js

aws lambda create-function \
  --function-name hello-cli \
  --zip-file fileb://function.zip \
  --handler index.handler \
  --runtime nodejs14.x \
  --role arn:aws:iam::117784694447:role/lambda-exemplo \
  | tee logs/lambda-create.log

# 4o passo - Invoke lambda!

aws lambda invoke \
  --function-name hello-cli \
  --log-type Tail \
  logs/lambda-exec.log

# 5o passo - Atualizando a lambda

zip function.zip index.js

aws lambda update-function-code \
  --zip-file fileb://function.zip \
  --function-name hello-cli \
  --publish \
  | tee logs/lambda-update.log

aws lambda invoke \
  --function-name hello-cli \
  --log-type Tail \
  logs/lambda-exec-update.log

# 6o passo - Remover tudo
aws lambda delete-function \
  --function-name hello-cli

aws iam delete-role \
  --role-name lambda-exemplo

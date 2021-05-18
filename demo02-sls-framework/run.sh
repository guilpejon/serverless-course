# instalar serverless framework
npm i -g serverless

# inicializar sls
sls # ou serverless

# sempre fazer deploy antes de tudo pra verificar se o ambiente está ok
sls deploy

# invocar a lambda na AWS
sls invoke -f hello
# invocar a lambda local
sls invoke local -f hello -l # -l == log

# configurar dashboard
sls

# logs
sls logs -f hello -t

# remove
sls remove

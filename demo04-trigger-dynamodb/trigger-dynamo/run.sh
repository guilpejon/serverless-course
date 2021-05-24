# test on aws
sls invoke -f hero-insert --logger
# test locally
sls invoke local -f hero-insert --logger

sls invoke local -f hero-insert --path requests-mock/hero.insert.json

# check for logs from stream
sls logs -f hero-trigger -t

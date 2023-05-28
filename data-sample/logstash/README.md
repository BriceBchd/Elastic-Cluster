# Data sample

## Load setup
- Extract the ca.crt from the elasticsearch keystore 
    `docker cp es01:/usr/share/elasticsearch/config/certs/ca/ca.crt .`
- Run the load.sh script 
    `./load.sh`
- Change user passwords in logstash config and dockerfile
- Change the elasticsearch hosts in logstash config and dockerfile if needed
- Run the logstash container with the dockerfile 
    `docker build -t my-logstash:1.0 . && docker run --rm -it --network=elastic_cluster_default my-logstash:1.0`
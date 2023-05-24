# Elastic Clusters

## Elastic-Only
Dockerized Elastic Cluster with Elastic buildin certs & keys inside Dockerfile

## Elastic-Kibana
Dockerized Elastic Cluster : 3es + 1kib
WIP : + 1lgs + beats agents

### How to use
```bash
# Create your .env file
cp .env.example .env
# Docker compose to start the cluster
docker-compose up -d
# Follow logs
docker-compose logs -f
# Stop the cluster
docker-compose down

# Get the ca cert
docker-compose exec es01 cat /usr/share/elasticsearch/config/certs/ca/ca.crt > ca.crt

# Start the cluster on startup
cp elastic-cluster.service /etc/systemd/system/elastic-cluster.service
systemctl enable elastic-cluster.service
systemctl start elastic-cluster.service

```

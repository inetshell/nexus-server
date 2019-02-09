# Nexus Server Deployment

Nexus 3 with the following configuration:
- HTTPS support with Let's Encrypt certificate

## Requirements:
* docker-ce-18.06.x
* docker-compose

## To deploy:
```
chmod u+x deploy.sh
export CERTBOT_EMAIL=info@example.com
export NEXUS_DNS=nexus.example.com
./deploy.sh
```

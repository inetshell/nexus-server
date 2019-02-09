#!/usr/bin/env bash
export SCRIPT_HOME="$( cd "$(dirname "${0}")" ; pwd -P )"
export VARS_FILE="${SCRIPT_HOME}/vars/load_vars.sh"

if [[ -f "${VARS_FILE}" ]]; then
    echo "Loading variables file ${VARS_FILE}"
    source "${VARS_FILE}"
fi

if [[ -z "${CERTBOT_EMAIL}" ]] || [[ -z ${NEXUS_DNS} ]]; then
    echo "CERTBOT_EMAIL, NEXUS_DNS variables are not defined"
    exit 1
fi

# Create and configure container directories
mkdir -p nexus-proxy/log/
mkdir -p nexus-server/data/
chmod 770 nexus-server/data/
chown 200:200 nexus-server/data/

docker-compose pull
docker-compose --project-name 'nexus' up --build -d

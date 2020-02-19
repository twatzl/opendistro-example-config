#!/bin/sh

if [[ -z "${DATA_PATH}" ]]; then
  echo "DATA_PATH not set. aborting."
  exit
fi

GIT_REPO="https://raw.githubusercontent.com/opendistro-for-elasticsearch/security/master/securityconfig"
CONF_DIR="${DATA_PATH}/opendistro/elasticsearch/securityconfig"
mkdir -p $CONF_DIR

curl -s $GIT_REPO/action_groups.yml --output $CONF_DIR/action_groups.yml
curl -s $GIT_REPO/config.yml --output $CONF_DIR/config.yml
curl -s $GIT_REPO/aelasticsearch.yml.example --output $CONF_DIR/elasticsearch.yml.example
curl -s $GIT_REPO/internal_users.yml --output $CONF_DIR/internal_users.yml
curl -s $GIT_REPO/roles.yml --output $CONF_DIR/roles.yml
curl -s $GIT_REPO/roles_mapping.yml --output $CONF_DIR/roles_mapping.yml
curl -s $GIT_REPO/tenants.yml --output $CONF_DIR/tenants.yml

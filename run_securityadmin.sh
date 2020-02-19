#!/bin/sh

docker exec odfe-node1 /bin/sh /usr/share/elasticsearch/plugins/opendistro_security/tools/securityadmin.sh -dci -icl -nhnv -cacert ../../../config/root-ca.pem -cert ../../../config/admin.pem -key ../../../config/admin-key.pem
docker exec odfe-node1 /bin/sh /usr/share/elasticsearch/plugins/opendistro_security/tools/securityadmin.sh -cd ../securityconfig/ -icl -nhnv -cacert .../../config/admin.pem -key ../../../config/admin-key.pem

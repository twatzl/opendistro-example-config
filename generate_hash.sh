#!/bin/sh

display_usage() {
	echo "Expected at least one parameter."
	echo -e "\nUsage:\n $0 <password> \n"
}

if [ $# -lt 1 ] 
then 
	display_usage
	exit 1
fi 

docker run amazon/opendistro-for-elasticsearch:1.3.0 /bin/sh /usr/share/elasticsearch/plugins/opendistro_security/tools/hash.sh -p $1

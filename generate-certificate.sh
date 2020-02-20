#!/bin/sh

SUBJECT="/C=AT/ST=Upper Austria/L=Linz/CN=twatzl.eu"
NAME='logstash'

openssl genrsa -out $NAME-key-temp.pem 4096
openssl pkcs8 -inform PEM -outform PEM -in $NAME-key-temp.pem -topk8 -nocrypt -v1 PBE-SHA1-3DES -out $NAME-key.pem
openssl req -new -key $NAME-key.pem -out $NAME.csr -subj "$SUBJECT"
openssl x509 -req -in $NAME.csr -CA root-ca.pem -CAkey root-ca-key.pem -CAcreateserial -sha256 -out $NAME.pem

rm $NAME-key-temp.pem
rm $NAME.csr
openssl x509 -subject -nameopt RFC2253 -noout -in $NAME.pem

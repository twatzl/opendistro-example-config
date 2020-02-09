openssl genrsa -out filebeat-key-temp.pem 4096
openssl pkcs8 -inform PEM -outform PEM -in filebeat-key-temp.pem -topk8 -nocrypt -v1 PBE-SHA1-3DES -out filebeat-key.pem
openssl req -new -key filebeat-key.pem -out filebeat.csr
openssl x509 -req -in filebeat.csr -CA root-ca.pem -CAkey root-ca-key.pem -CAcreateserial -sha256 -out filebeat.pem


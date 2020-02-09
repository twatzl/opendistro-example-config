#!/bin/sh

# https://opendistro.github.io/for-elasticsearch-docs/docs/security-configuration/generate-certificates/
# Generate a private key
openssl genrsa -out root-ca-key.pem 4096
# Generate a root certificate
openssl req -new -x509 -sha256 -days 365 -key root-ca-key.pem -out root-ca.pem
# Generate an admin certificate
openssl genrsa -out admin-key-temp.pem 4096
openssl pkcs8 -inform PEM -outform PEM -in admin-key-temp.pem -topk8 -nocrypt -v1 PBE-SHA1-3DES -out admin-key.pem
openssl req -new -key admin-key.pem -out admin.csr
openssl x509 -req -in admin.csr -CA root-ca.pem -CAkey root-ca-key.pem -CAcreateserial -sha256 -out admin.pem
# Node1 cert
openssl genrsa -out node1-key-temp.pem 4096
openssl pkcs8 -inform PEM -outform PEM -in node1-key-temp.pem -topk8 -nocrypt -v1 PBE-SHA1-3DES -out node1-key.pem
openssl req -new -key node1-key.pem -out node1.csr
openssl x509 -req -in node1.csr -CA root-ca.pem -CAkey root-ca-key.pem -CAcreateserial -sha256 -out node1.pem
# Node2 cert
openssl genrsa -out node2-key-temp.pem 4096
openssl pkcs8 -inform PEM -outform PEM -in node2-key-temp.pem -topk8 -nocrypt -v1 PBE-SHA1-3DES -out node2-key.pem
openssl req -new -key node2-key.pem -out node2.csr
openssl x509 -req -in node2.csr -CA root-ca.pem -CAkey root-ca-key.pem -CAcreateserial -sha256 -out node2.pem
# Cleanup
rm admin-key-temp.pem
rm admin.csr
rm node-key-temp.pem
rm node.csr
rm node1-key-temp.pem
rm node1.csr
rm node2-key-temp.pem
rm node2.csr
openssl x509 -subject -nameopt RFC2253 -noout -in admin.pem
openssl x509 -subject -nameopt RFC2253 -noout -in node1.pem
openssl x509 -subject -nameopt RFC2253 -noout -in node2.pem

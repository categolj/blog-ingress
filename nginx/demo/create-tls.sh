#!/bin/bash

kubectl create secret tls tls-secret -n default \
  --cert=../../../../../sslip.io/sslip.io.crt  \
  --key=../../../../../sslip.io/sslip.io.key

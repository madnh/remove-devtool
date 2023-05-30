#!/usr/bin/env bash

# Chii listening port
CHII_PORT=${CHII_PORT:-8080}

echo "Chii port: ${CHII_PORT}"

echo -e "\n\nStarting Chii server"
echo "----------------------------------------"
chii start -p ${CHII_PORT}

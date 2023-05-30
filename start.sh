#!/usr/bin/env bash

# Chii listening port
CHII_PORT=${CHII_PORT:-8080}
# Site listening port
TARGET_SITE_PORT=${TARGET_SITE_PORT:-3000}
# Caddy listening port
CADDY_PORT=${CADDY_PORT:-4545}


echo "Chii port: ${CHII_PORT}"
echo "Target site port: ${TARGET_SITE_PORT}"
echo "Caddy port: ${CADDY_PORT}"

echo -e "----------------------------------------\n\n"

echo "Site need to be protected by basic auth"
SITE_AUTH=$(caddy hash-password)


# Create Caddyfile
CADDY_CONFIG=$(cat <<EOF
:${CADDY_PORT} {
  handle_path /chii/* {
    reverse_proxy localhost:${CHII_PORT}
  }

  handle_path /* {
    basicauth {
      user ${SITE_AUTH}
    }

    reverse_proxy localhost:${TARGET_SITE_PORT}
  }
}
EOF
)

echo "$CADDY_CONFIG" >| Caddyfile

echo -e "\n\nStarting Caddy server"
echo "----------------------------------------"
echo " Caddy site: http://localhost:${CADDY_PORT}/"
echo " Chii site:  http://localhost:${CADDY_PORT}/chii"
echo " Target site:  http://localhost:${TARGET_SITE_PORT}/"
echo "----------------------------------------"
echo -e "\n\n"

caddy run --config ./Caddyfile --adapter caddyfile

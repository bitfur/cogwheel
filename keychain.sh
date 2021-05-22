#!/bin/bash
# Installs keychain config
cat <<EOF >> ~/.bashrc
keychain --nogui id_rsa
. ~/.keychain/$HOSTNAME-sh
EOF

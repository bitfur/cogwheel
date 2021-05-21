#!/bin/bash
cat <<EOF >> ~/.bashrc
keychain --nogui id_rsa
. ~/.keychain/$HOSTNAME-sh
EOF

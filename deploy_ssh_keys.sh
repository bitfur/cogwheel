#!/bin/bash
# Deploys ssh keys to running user
mkdir -p ~/.ssh
cp -r ssh_keys/* ~/.ssh
chmod 700 ~/.ssh
chmod 644 ~/.ssh/id_rsa.pub
chmod 600 ~/.ssh/id_rsa

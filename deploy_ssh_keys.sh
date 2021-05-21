#!/bin/bash
# Deploys ssh keys to running user
cp -r ssh_keys ~/
chmod 700 ~/.ssh
chmod 644 ~/.ssh/id_rsa.pub
chmod 600 ~/.ssh/id_rsa

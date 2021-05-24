#!/bin/bash
echo Running 
squid -z
squid &
python vpn.py


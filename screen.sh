#!/bin/bash
cat <<EOF > ~/.screenrc
shelltitle ""
escape ^kk
startup_message off
defscrollback 9000
bind k focus up
bind j focus down
bind h focus left
bind l focus right
caption always "%{0}<<<%n:%t>>>"
rendition so "="
EOF

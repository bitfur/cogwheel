#!/bin/bash
cat <<EOF > ~/.screenrc
shelltitle ""
escape ^ff
startup_message off
defscrollback 9000
bind k focus up
bind j focus down
bind h focus left
bind l focus right
caption always "REMOTE:%{0}<<<%n:%t>>>"
rendition so "="
EOF

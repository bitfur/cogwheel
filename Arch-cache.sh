#!/bin/bash
#pacman -S squid
cat <<EOF > /etc/squid/squid.conf
refresh_pattern \.pkg\.tar\.   0       20%     4320      reload-into-ims
refresh_pattern .              0       0%      0
maximum_object_size 256 MB
cache_dir aufs /var/cache/squid 10000 16 256
shutdown_lifetime 1 seconds 
http_port 3128 intercept
http_port 3129
EOF



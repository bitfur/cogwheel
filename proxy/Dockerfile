# docker build -t rkasvpn .
# docker run --cap-add=NET_ADMIN --device /dev/net/tun:/dev/net/tun --name rkasvpn --rm -t test
# docker run -it --rm --entrypoint /bin/bash test
FROM archlinux
RUN pacman --noconfirm -Sy openconnect python python-pip \
openvpn net-tools
RUN pip install pexpect
WORKDIR /root/
ADD run.sh .
ADD vpn.py .
ADD ucivpn .
RUN chmod +x run.sh
ENTRYPOINT ["/bin/bash", "run.sh"]



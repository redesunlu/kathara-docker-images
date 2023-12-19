FROM kathara/base

ARG DEBIAN_FRONTEND="noninteractive"
RUN apt update
#RUN apt upgrade -y

RUN wget -O quagga.deb http://snapshot.debian.org/archive/debian/20161019T045440Z/pool/main/q/quagga/quagga_1.0.20160315-3_$(dpkg --print-architecture).deb
RUN apt-get install -y \
	exim4 \
	tshark \
	iptables \
	xinetd \
	dovecot-pop3d \
	squid \
	lynx \
	telnetd \
	alpine \
	&& rm -rf /var/lib/apt/lists/*
RUN     echo root:malware | chpasswd && \
	echo "# default: on \n \
	    # description: The telnet server serves telnet sessions; it uses unencrypted username/password pairs for authentication. \n \
	    service telnet \n \
	    { \n \
	    disable = no \n \
	    flags           = REUSE \n \
	    socket_type     = stream \n \
	    wait            = no \n \
	    user            = root \n \
	    server          = /usr/sbin/in.telnetd \n \
	    log_on_failure  += USERID \n \
	    }" | tee -a /etc/xinetd.d/telnet && \
	rm -f /etc/securetty

ENTRYPOINT ["bash"]
CMD ["-c","xinetd -dontfork -stayalive"]


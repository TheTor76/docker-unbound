FROM ubuntu:latest
RUN apt-get update && apt-get -y upgrade
RUN	apt-get install -y unbound wget

WORKDIR /
ADD src/prep.sh /prep.sh
ADD src/root.key /var/unbound/etc/
ADD src/unbound.conf /etc/unbound/unbound.conf

RUN chmod +x /prep.sh
RUN /prep.sh

RUN apt-get -y autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

VOLUME ["/var/log/"]

EXPOSE 53
EXPOSE 53/UDP

ENTRYPOINT ["/usr/sbin/unbound", "-d", "-c", "/etc/unbound/unbound.conf"]

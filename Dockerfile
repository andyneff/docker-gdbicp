# Latest version of ubuntu with 32 bit support?
FROM ubuntu:18.04

SHELL ["/bin/bash", "-euxvc"]

RUN dpkg --add-architecture i386; \
    apt-get update; \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      libc6:i386 libncurses5:i386 libstdc++6:i386; \
    rm -rf /var/lib/apt/lists/*

ADD https://www.cs.rpi.edu/research/groups/vision/gdbicp/exec/files/revision_1/gdbicp_linux.tar.bz2 /

RUN cd /usr/local/bin; \
    tar xf /gdbicp_linux.tar.bz2; \
    rm /gdbicp_linux.tar.bz2

CMD gdbicp
FROM ubuntu:22.04
MAINTAINER Strebs <stroebs@users.noreply.github.com>

ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root

RUN apt update && \
    apt install libpcre3-dev libssl-dev mysql-server libmysqlclient-dev \
    mysql-client g++ libmaxminddb-dev libicu-dev gettext libasprintf-dev \
    python2.7-dev liblua5.2-dev libperl-dev make cmake git -yq && \
    apt-get clean -y && \
    apt-get autoclean -y && \
    rm -fr /var/lib/apt && \
    git clone https://github.com/Verlihub/verlihub.git /usr/src/verlihub && \
    cd /usr/src/verlihub && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make && \
    make install

ADD start.sh /usr/local/bin/start.sh

RUN ldconfig && chmod +x /usr/local/bin/start.sh

EXPOSE 4111

ENTRYPOINT ["/usr/local/bin/start.sh"]

CMD ["--run"]

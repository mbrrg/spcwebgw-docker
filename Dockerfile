FROM debian:jessie-slim

RUN apt-get update && apt-get install -y \
    curl \
    libssl1.0.0 \
    vim-common \
    && curl -L -o /usr/local/bin/envsubst https://github.com/a8m/envsubst/releases/download/v1.2.0/envsubst-Linux-x86_64 \
    && chmod 755 /usr/local/bin/envsubst \
    && apt-get purge -y --auto-remove curl \
    && rm -rf /var/lib/apt/lists/*

RUN groupadd -r spcwebgw && useradd --no-log-init -r -g spcwebgw spcwebgw

COPY ./entrypoint.sh /
RUN chmod 755 /entrypoint.sh

ADD spc-web-gateway-ubuntu_x86_64.1.2.tar.gz /opt
WORKDIR /opt/spc-web-gateway-ubuntu_x86_64.1.2
RUN chown -R spcwebgw:spcwebgw .
COPY ./config_template.xml .

EXPOSE 8088 16000

USER spcwebgw

ENTRYPOINT [ "/entrypoint.sh" ]

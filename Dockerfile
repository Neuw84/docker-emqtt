FROM nerdnobs/base

MAINTAINER @nerdnobs

# Standard Setup Block
ENV DEBIAN_FRONTEND="noninteractive" HOME="/root" TERM="xterm"
RUN apt-get update \
    && apt-get upgrade -y -o Dpkg::Options::="--force-confold" \
    && apt-get clean \
    && apt-get install -y -o Dpkg::Options::="--force-confold" \
      unzip \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
WORKDIR /root
# Download latest version
ADD http://emqtt.io/downloads/latest/ubuntu /root/emqtt.zip
RUN unzip emqtt.zip && rm -rf emqtt.zip

# Install config files
COPY ./files/vm.args emqttd/etc/vm.args 
COPY ./files/emqttd.config emqttd/etc/emqttd.config 

EXPOSE 1883
EXPOSE 8883
EXPOSE 8083
EXPOSE 18083

FROM blitznote/debootstrap-amd64:16.04 


MAINTAINER @neuw84

USER root
WORKDIR /root

RUN apt-get -qq update && apt-get install -y libssl1.0.0

# Download latest version
ADD http://emqtt.io/downloads/stable/ubuntu /root/emqtt.zip
RUN unzip emqtt.zip && rm -rf emqtt.zip
RUN chmod -R +x /root/emqttd/
# Install rootfs files
COPY ./rootfs/* /
COPY docker-entrypoint.sh /root
RUN chmod +x /root/docker-entrypoint.sh


# Expose Ports
EXPOSE 1883
EXPOSE 8883
EXPOSE 8083
EXPOSE 18083


CMD ["/root/docker-entrypoint.sh","start-daemon"]


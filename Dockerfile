FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y wget unzip ffmpeg && \
    apt-get clean

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

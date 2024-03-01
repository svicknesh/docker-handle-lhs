FROM eclipse-temurin:latest
ARG PUID=1000
ARG PGID=1000
ENV PUID=$PUID
ENV PGID=$PGID
RUN groupadd -g $PGID lhs && useradd -u $PUID -g $PGID -s /bin/bash -m -d /home/lhs lhs
RUN wget -c https://handle.net/hnr-source/handle-9.3.1-distribution.tar.gz -O /tmp/handle-9.3.1-distribution.tar.gz && \
tar -xf /tmp/handle-9.3.1-distribution.tar.gz -C /tmp/ && \
mv /tmp/handle-9.3.1 /home/lhs/hsj && \
rm /tmp/handle-9.3.1-distribution.tar.gz && \
mkdir -p /home/lhs/data
ADD https://github.com/tianon/gosu/releases/download/1.17/gosu-amd64 /usr/local/bin/gosu
RUN chmod 755 /usr/local/bin/gosu
COPY entrypoint.sh /home/lhs/hsj/bin/entrypoint.sh
WORKDIR /home/lhs/data
#CMD ["/home/lhs/hsj/bin/hdl-server", "/home/lhs/data"]
CMD ["/home/lhs/hsj/bin/entrypoint.sh"]

FROM openjdk:8-jdk

# Tinkerpop#Gremlin
ENV GREMLIN_SERVER_VERSION 3.3.3
ENV GREMLIN_SERVER_ZIP_URL https://www.apache.org/dyn/closer.cgi?action=download&filename=tinkerpop/$GREMLIN_SERVER_VERSION/apache-tinkerpop-gremlin-server-$GREMLIN_SERVER_VERSION-bin.zip 
RUN cd / && \
    wget -O gremlin-server.zip "$GREMLIN_SERVER_ZIP_URL" && \
    unzip gremlin-server.zip && \
    ln -s apache-tinkerpop-gremlin-server-$GREMLIN_SERVER_VERSION /gremlin-server && \
    rm -f gremlin-server.zip && \
    mv -f /gremlin-server/conf/gremlin-server.yaml /gremlin-server/conf/gremlin-server.yaml.org
COPY gremlin-server.yaml /gremlin-server/conf/gremlin-server.yaml

# graphexp
ENV GRAPHEXP_VERSION 0.8.0
ENV GRAPHEXP_ZIP_URL https://github.com/bricaud/graphexp/archive/v$GRAPHEXP_VERSION.zip
RUN cd / && \
    wget -O graphexp.zip "$GRAPHEXP_ZIP_URL" && \
    unzip graphexp.zip && \
    ln -s graphexp-$GRAPHEXP_VERSION /graphexp

RUN apt-get update && \
    apt-get install -y supervisor && \
    apt-get clean

RUN echo '[supervisord] \n\
nodaemon=true \n\
[inet_http_server] \n\
port = 0.0.0.0:9001 \n\
[program:gremlin-server] \n\
command=/gremlin-server/bin/gremlin-server.sh conf/gremlin-server.yaml \n\
autostart=true \n\
autorestart=true \n\
stdout_logfile=/dev/stdout \n\
stdout_logfile_maxbytes=0 \n\
stderr_logfile=/dev/stderr \n\
stderr_logfile_maxbytes=0 \n\
[program:graphexp-server] \n\
command=python -m SimpleHTTPServer 8080 \n\
directory=/graphexp \n\
autostart=true \n\
autorestart=true \n\
stdout_logfile=/dev/stdout \n\
stdout_logfile_maxbytes=0 \n\
stderr_logfile=/dev/stderr \n\
stderr_logfile_maxbytes=0 \n\
' > /supervisord.conf


EXPOSE 8182
EXPOSE 8080
EXPOSE 9001

CMD /usr/bin/supervisord -c /supervisord.conf
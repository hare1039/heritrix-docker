FROM java:6-jre
MAINTAINER hare1039 hare1039@hare1039.nctu.me

ENV JAVA_PATH=/usr/lib/jvm/java-6-openjdk-amd64/jre
ENV HERITRIX_HOME=/heritrix-3.1.1
ENV JAVA_OPTS=-Xmx1024M
ENV ADMIN=admin
ENV PASSWORD=heritrix

VOLUME ["/jobs"]

RUN apt-get update && \
    apt-get install wget p7zip-full && \
    wget http://builds.archive.org:8080/maven2/org/archive/heritrix/heritrix/3.1.1/heritrix-3.1.1-dist.zip && \
    7z x heritrix-3.1.1-dist.zip && \
    chmod u+x $HERITRIX_HOME/bin/heritrix

EXPOSE 8443

ENTRYPOINT ["bash", "-c", "$HERITRIX_HOME/bin/heritrix -b / -a $ADMIN:$PASSWORD -j /jobs; sleep infinity;"]
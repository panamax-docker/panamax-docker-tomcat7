FROM ubuntu:quantal
MAINTAINER Chaitanya Akkineni <chaitanya.akkineni@savvis.com>

# Install packages
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y upgrade

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y openjdk-7-jre-headless wget
RUN wget -O /tmp/tomcat7.tar.gz http://mirror.nexcess.net/apache/tomcat/tomcat-7/v7.0.52/bin/apache-tomcat-7.0.52.tar.gz
RUN (cd /opt && tar zxf /tmp/tomcat7.tar.gz)
RUN (mv /opt/apache-tomcat* /opt/tomcat)
ADD ./run.sh /usr/local/bin/run
EXPOSE 8080
CMD ["/bin/sh", "-e", "/usr/local/bin/run"]

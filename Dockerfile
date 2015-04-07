FROM centos:centos7
MAINTAINER QCData Inc <den-developers@qcdata.com>

RUN yum update -y
RUN yum install -y \
    tar \
    wget
    
RUN wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u40-b26/jdk-8u40-linux-x64.tar.gz"
RUN tar -xvf jdk-8u40-linux-x64.tar.gz -C /opt && rm /opt/jdk-8u40-linux-x64.tar.gz

RUN chown -R root: jdk1.8.0_40
RUN alternatives --install /usr/bin/java java /opt/jdk1.8.0_40/bin/java 1
RUN alternatives --install /usr/bin/javac javac /opt/jdk1.8.0_40/bin/javac 1
RUN alternatives --install /usr/bin/jar jar /opt/jdk1.8.0_40/bin/jar 1

FROM centos:centos7
MAINTAINER QCData Inc <den-developers@qcdata.com>

RUN yum update -y
RUN yum install -y \
    tar \
    wget
    
RUN wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u51-b16/jdk-8u51-linux-x64.tar.gz"
RUN tar -xvf jdk-8u51-linux-x64.tar.gz -C /opt && rm jdk-8u51-linux-x64.tar.gz

RUN chown -R root: /opt/jdk1.8.0_51
RUN alternatives --install /usr/bin/java java /opt/jdk1.8.0_51/bin/java 1
RUN alternatives --install /usr/bin/javac javac /opt/jdk1.8.0_51/bin/javac 1
RUN alternatives --install /usr/bin/jar jar /opt/jdk1.8.0_51/bin/jar 1

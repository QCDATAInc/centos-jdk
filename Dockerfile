FROM centos:centos7
MAINTAINER QCData Inc <den-developers@qcdata.com>

ENV JVER 8
ENV JUPD 121
ENV JBUILD b13
ENV JURLID e9e7ea248e2c4826b92b3f075a80e441

ENV JED ${JVER}u${JUPD}
ENV JDK jdk1.${JVER}.0_${JUPD}

RUN yum update -y
RUN yum install -y \
    tar \
    wget

RUN wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/${JED}-${JBUILD}/${JURLID}/jdk-${JED}-linux-x64.tar.gz"
RUN tar -xvf jdk-${JED}-linux-x64.tar.gz -C /opt && rm jdk-${JED}-linux-x64.tar.gz

RUN chown -R root: /opt/${JDK}
RUN alternatives --install /usr/bin/java java /opt/${JDK}/bin/java 1
RUN alternatives --install /usr/bin/javac javac /opt/${JDK}/bin/javac 1
RUN alternatives --install /usr/bin/jar jar /opt/${JDK}/bin/jar 1

FROM centos:centos7
MAINTAINER QCData Inc <den-developers@qcdata.com>

ENV JVER 8
ENV JUPD 131
ENV JBUILD b11
ENV JURLID d54c1d3a095b4ff2b6607d096fa80163

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

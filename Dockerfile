FROM centos:centos7
MAINTAINER QC Data Inc <den-developers@qcdata.com>

ENV JVER 8
ENV JUPD 144
ENV JBUILD b01
ENV JURLID 090f390dda5b47b9b721c7dfaa008135

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

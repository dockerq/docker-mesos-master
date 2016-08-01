FROM ubuntu:14.04
MAINTAINER wlu wlu@linkernetworks.com

RUN echo "deb http://repos.mesosphere.io/ubuntu/ trusty main" > /etc/apt/sources.list.d/mesosphere.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF && \
    apt-get -y update && \
    apt-get -y install mesos=1.0.0-2.0.89.ubuntu1404

RUN apt-get install -y vim && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN ln -f -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

CMD ["mesos-master"]

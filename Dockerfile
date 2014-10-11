FROM centos:centos6 
MAINTAINER Mariano Gardellini <mariano.gardellini@gmail.com>

RUN yum -y update
RUN yum install -y wget
RUN wget http://repo.mysql.com/mysql-community-release-el6-5.noarch.rpm
RUN rpm -ivh mysql-community-release-el6-5.noarch.rpm
RUN yum install -y mysql mysql-server

ADD ./run.sh /usr/local/bin/run
RUN chmod +x /usr/local/bin/run

EXPOSE 3306

ENTRYPOINT ["/usr/local/bin/run"]

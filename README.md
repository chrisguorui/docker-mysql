docker-mysql
==============

start the container:

  docker build --rm -t mgardellini/centos:mysql .
  docker run -t -i --name db -p 3306:3306 mgardellini/centos:mysql /run

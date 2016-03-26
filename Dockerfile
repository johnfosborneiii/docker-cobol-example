############################################################
# Dockerfile to run COBOL on Linux! 
############################################################

# Set the base image to use to Ubuntu
FROM centos:centos6
MAINTAINER John Osborne <johnfosborneiii@gmail.com>

# Update sources
RUN yum -y install epel-release gcc git wget; yum clean all
RUN yum -y install gmp gmp-devel gmp-status; yum clean all
RUN yum -y install ncurses-devel; yum clean all
RUN yum -y install ldb-tools; yum clean all
RUN yum -y install libldb; yum clean all
RUN yum -y install libldb-devel; yum clean all
RUN yum -y install mlocate; yum clean all
RUN updatedb; yum clean all
RUN wget http://client.pdinc.us/open-cobol-1.1-1.x86_64.rpm 
RUN rpm -i open-cobol-1.1-1.x86_64.rpm

RUN locate ldb
RUN locate ldb.so
RUN ln -s /usr/lib64/libldb.so /usr/lib64/ldb.so

#This cache bust makes sure the docker build gets the latest code from github
ARG CACHEBUST=1

RUN git clone https://github.com/johnfosborneiii/docker-cobol-example
#RUN cobc -free -x -o helloworld docker-cobol-example/johnsCOBOLapp.cbl
RUN cobc -x docker-cobol-example/johnsCOBOLapp.cbl
#RUN cobcrun helloworld
RUN ./helloworld

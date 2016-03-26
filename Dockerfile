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
RUN yum -y install mlocate; yum clean all
RUN yum -y install ldb-tools ldb-devel ldb; yum clean all
RUN updatedb; yum clean all
RUN wget http://client.pdinc.us/open-cobol-1.1-1.x86_64.rpm 
RUN rpm -i open-cobol-1.1-1.x86_64.rpm

RUN yum -y install db4 db4-devel; yum clean all

#This cache bust makes sure the docker build gets the latest code from github
ARG CACHEBUST=2

RUN git clone https://github.com/johnfosborneiii/docker-cobol-example
#RUN cobc -free -x -o helloworld docker-cobol-example/johnsCOBOLapp.cbl
RUN cobc -free -x -o johnsCOBOLapp docker-cobol-example/johnsCOBOLapp.cbl -L/usr/lib64/ -ldb
#RUN cobcrun helloworld
RUN ls -l
RUN ./johnsCOBOLapp 

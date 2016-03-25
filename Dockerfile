############################################################
# Dockerfile to run COBOL on Linux! 
############################################################

# Set the base image to use to Ubuntu
FROM centos:centos6
MAINTAINER John Osborne <johnfosborneiii@gmail.com>

# Update sources
RUN yum -y install epel-release open-cobol*; yum clean all

RUN git clone https://github.com/johnfosborneiii/docker-cobol-example
RUN cobc -free -x -o helloworld-exe HELLO.COB
RUN ./helloworld-exe

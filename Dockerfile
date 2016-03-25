############################################################
# Dockerfile to run COBOL on Linux! 
############################################################

# Set the base image to use to Ubuntu
FROM centos:centos6
MAINTAINER John Osborne <johnfosborneiii@gmail.com>

# Update sources
RUN yum -y install epel-release git wget; yum clean all
RUN wget http://client.pdinc.us/open-cobol-1.1-1.x86_64.rpm 
RUN rpm -i open-cobol-1.1-1.x86_64.rpm

RUN git clone https://github.com/johnfosborneiii/docker-cobol-example
RUN chmod 777 -R docker-cobol-example*
RUN cobc -free -x -o helloworld-exe docker-cobol-example/HELLO.COB
RUN ./helloworld-exe

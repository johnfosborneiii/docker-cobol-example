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
RUN yum -y install httpd && yum clean all
RUN yum -y install php && yum clean all

# Add httpd.conf file which has php module loaded and index.php
ADD resources/httpd.conf /etc/httpd/conf/httpd.conf 
ADD src/php/index.php /var/www/html/

RUN mkdir /cobol/
ADD src/COBOL/johnsCOBOLapp.cbl /cobol/

RUN cobc -free -x -o johnsCOBOLapp /cobol/johnsCOBOLapp.cbl -L/usr/lib64/ -ldb

ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]

EXPOSE 80

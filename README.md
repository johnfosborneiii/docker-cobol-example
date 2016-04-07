COBOL running in a Docker Container on CentOS 
===============

This Docker image runs a PHP page in Apache HTTPD which calls COBOL code and prints it to the screen

Build Image
---------------

You can manually build image by below commands.

```bash
$ git clone https://github.com/johnfosborneiii/docker-cobol-example.git
$ cd docker-cobol-example
$ docker build -t johnfosborneiii/docker-cobol-example .
```

And you can also pull image from DockerHub.

Run PHP
---------------

Build and Run Application
```
$ docker-compose up -d
```

Access by Web browser

```
http://localhost:8080
```
Run in OpenShift
---------------

Build and Run Application
```
$ oc new-project cobolex
$ oc new-app johnfosborneiii/docker-cobol-example 
```

Create a route
```
$ oc expose service cobolex --hostname=mycobol.hostname.com
```

Note: You may have to allow root containers to be run in OpenShift
```
$ oc project cobolex
$ oadm policy add-scc-to-user anyuid -z default 
```
https://blog.openshift.com/getting-any-docker-image-running-in-your-own-openshift-cluster/


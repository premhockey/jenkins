<<<<<<< HEAD
# linux
=======
# docker-centos-jenkins

A Dockerfile that produces a CentOS-based Docker image that will run the latest stable [Jenkins][jenkins].

The build is based on [internavenue/docker-centos-base][docker-centos-base].

[Jenkins]: http://jenkins-ci.org/

## Included packages (and their dependencies)

* Jenkins
* OpenJDK 1.7

## Image Creation

This example creates the image with the tag `internavenue/centos-jenkins`, but you can
change this to use your own username.

```
$ docker build -t="internavenue/centos-jenkins" .
```

Alternately, you can run the following if you have *GNU Make* installed...

```
$ make
```

You can also specify a custom docker username like so:

```
$ make DOCKER_USER=internavenue
```

## Container Creation / Running

The Nginx web server is configured to store web root in `/srv/www` inside the container.
You can map the container's `/srv/www` volume to a volume on the host so the data
becomes independant of the running container.

This example uses `/srv/docker/lon-dev-web` to host the web application, but you can modify
this to your needs.

When the container runs, it creates a superuser with a random password.  You
can set the username and password for the superuser by setting the container's
environment variables.  This lets you discover the username and password of the
superuser from within a linked container or from the output of `docker inspect
web1`.

``` shell
$ mkdir -p /srv/docker/lon-dev-web
$  docker run -d --name="jenkin" -p 10.250.6.11:80:8080 -v /srv/docker/lon-dev-web:/srv/www -e USER="jenkins" -e PASS="jenkins" jenkins

```

``

>>>>>>> d2934c2df931630e371a68616c9d596a5c9d3118

FROM centos:7
MAINTAINER PREM KUMAR
RUN yum -y install wget openssh-server openssh initscripts

RUN wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
RUN rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key

RUN yum -y install \
  java-1.8.0-openjdk-devel\
  jenkins

# Clean up YUM when done.
RUN yum clean all

ADD scripts /scripts
RUN chmod +x /scripts/start.sh
RUN touch /first_run

# The --deaemon removed from the init file.
ADD etc/jenkins /etc/init.d/jenkins
RUN chmod +x /etc/init.d/jenkins

EXPOSE 8080 22 80

VOLUME ["/vagrant", "/run", "/var/lib/jenkins", "/var/log" "/var/cache/jenkins/war]

# Kicking in
CMD ["/scripts/start.sh"]

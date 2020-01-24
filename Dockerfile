FROM centos:7

RUN yum -y install wget openssh-server openssh initscripts

RUN wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
RUN rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key

RUN yum -y install \
  java-1.8.0-openjdk-devel\
  jenkins\
  openssh\
  openssh-clients \
  which \
  bind-utils \
  https://releases.ansible.com/ansible/rpm/release/epel-7-x86_64/ansible-2.8.8-1.el7.ans.noarch.rpm \
  https://download.docker.com/linux/centos/7/x86_64/stable/Packages/docker-ce-18.03.1.ce-1.el7.centos.x86_64.rpm

# Clean up YUM when done.
RUN ssh-keygen -b 2048 -t rsa -f -q -N ""

ADD scripts /scripts
RUN chmod +x /scripts/start.sh
RUN touch /first_run

# The --deaemon removed from the init file.
ADD etc/jenkins /etc/init.d/jenkins
RUN chmod +x /etc/init.d/jenkins

EXPOSE 8080 22 80


VOLUME ["/var/lib/jenkins", "/var/log", "/var/cache/jenkins/war"]

# Kicking in
CMD ["/scripts/start.sh"]




#docker run -d --name="jenkin" -p 10.74.68.64:8080:8080 -v /srv/docker/lon-dev-web:/srv/www -e USER="jenkins" -e PASS="jenkins" jenkins



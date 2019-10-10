FROM centos:7
RUN yum install gcc* -y
RUN yum install -y https://centos7.iuscommunity.org/ius-release.rpm
RUN yum update -y
RUN yum install -y python36u python36u-libs python36u-devel python36u-pip
RUN yum install supervisor -y
RUN pip3.6 install setuptools
RUN pip3.6 install elastalert && mkdir -p /etc/esconfig && mkdir -p /etc/esrules && mkdir /opt/logs/
ADD supervisor.conf /etc/supervisor.conf
ADD start_elastalert.sh /opt/
RUN chmod +x /opt/start_elastalert.sh
CMD ["/opt/start_elastalert.sh"]


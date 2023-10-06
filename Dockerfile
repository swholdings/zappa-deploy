FROM amazon/aws-cli:latest

RUN yum install python3 python3-pip -y
RUN pip3 install virtualenv

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
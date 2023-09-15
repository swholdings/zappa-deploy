FROM amazon/aws-cli:latest

ADD requirements/deploy.txt /requirements/deploy.txt
ADD requirements/requirements.txt /requirements/requirements.txt
RUN yum install python3 python3-pip -y
RUN pip3 install virtualenv
RUN pip3 install -r requirements/deploy.txt

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
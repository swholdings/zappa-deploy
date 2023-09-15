FROM amazon/aws-cli:latest

COPY requirements/requirements.txt /requirements/
COPY requirements/deploy.txt /requirements/
RUN yum install python3 python3-pip -y
RUN pip3 install virtualenv
RUN pip3 install -r requirements/deploy.txt

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
FROM ubuntu:latest

RUN apt update && apt upgrade -y
RUN apt install -y python3 python3-pip

RUN pip3 install virtualenv

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
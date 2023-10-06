FROM ubuntu:latest

RUN apt update && apt upgrade -y
RUN apt install -y python3 python3-pip

RUN pip3 install virtualenv

COPY entrypoint.sh /entrypoint.sh
SHELL ["/bin/bash", "-c"]
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
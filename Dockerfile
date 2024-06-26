FROM ubuntu:22.04

RUN apt update && apt upgrade -y
RUN apt install -y python3 python3-pip

RUN pip3 install virtualenv

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
FROM ubuntu:trusty
MAINTAINER "Syncano DevOps Team" <devops@syncano.com>

ENV LAST_REFRESHED 2015-12-17
ENV export SYNCANO_APIROOT='https://api.syncano.io/'

COPY requirements.txt /tmp/requirements.txt
COPY external_requirements.txt /tmp/external_requirements.txt

RUN apt-get update && apt-get install -qqy \
    git \
    libffi-dev \
    libssl-dev \
    libjpeg-dev \
    python-dev \
    wget \
    && wget https://bootstrap.pypa.io/get-pip.py \
    && python get-pip.py \
    && pip install --upgrade pip \
    && pip install -r /tmp/requirements.txt \
    && pip install -r /tmp/external_requirements.txt

# create a special user to run code
# user without root privileges greatly improves security
RUN groupadd -r syncano \
    && useradd -r -g syncano syncano
RUN chmod 777 /tmp

USER syncano
CMD ["python"]

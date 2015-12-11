FROM python:2.7

MAINTAINER "Syncano DevOps Team" <devops@syncano.com>

ENV LAST_REFRESHED 2015-12-11

RUN apt-get update && apt-get install -qqy \
    git \
    libffi-dev \
    libssl-dev \
    libjpeg-dev

ENV export SYNCANO_APIROOT='https://api.syncano.io/'

COPY requirements.txt /tmp/requirements.txt
COPY external_requirements.txt /tmp/external_requirements.txt
RUN pip install -r /tmp/requirements.txt \
    && pip install -r /tmp/external_requirements.txt

RUN chmod 1777 /tmp
# create a special user to run code
# user without root privileges greatly improves security
RUN groupadd -r syncano && useradd -r -g syncano syncano
USER syncano


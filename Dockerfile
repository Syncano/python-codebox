FROM python:2.7

MAINTAINER "Justyna Ilczuk" <justyna.ilczuk@syncano.com>

ENV LAST_REFRESHED 2015-02-25

RUN apt-get update && apt-get install -qqy git

RUN pip install git+https://github.com/syncano/syncano-python@release/4.0

ENV export SYNCANO_APIROOT='https://api.syncano.io/'

COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

RUN chmod 1777 /tmp
# create a special user to run code
# user without root privileges greatly improves security
RUN groupadd -r syncano && useradd -r -g syncano syncano
USER syncano


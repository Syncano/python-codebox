FROM python:2.7

MAINTAINER "Justyna Ilczuk" <justyna.ilczuk@syncano.com>

ENV LAST_REFRESHED 2015-02-25

RUN apt-get update && apt-get install -qqy git

RUN git clone https://github.com/Syncano/syncano-python.git && \
    cd syncano-python && \
    git checkout -b release/4.0 origin/release/4.0 && \
    python setup.py install

ENV export SYNCANO_APIROOT='https://v4.hydraengine.com/'

COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

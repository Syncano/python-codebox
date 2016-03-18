FROM ubuntu:trusty
MAINTAINER "Syncano DevOps Team" <devops@syncano.com>

ENV LAST_REFRESHED 2016-03-18
ENV export SYNCANO_APIROOT='https://api.syncano.io/'

COPY *requirements*.txt /tmp/

RUN apt-get update && apt-get install -qqy \
    git \
    libffi-dev \
    libssl-dev \
    libjpeg-dev \
    python-dev \
    python-numpy \
    python-scipy \
    wget && \
    wget https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    pip install --upgrade pip && \
    pip install -r /tmp/requirements_base.txt && \
    mkdir /home/syncano

WORKDIR /home/syncano/
RUN virtualenv v4.1 && \
    . v4.1/bin/activate && \
    pip install -r /tmp/requirements_v41.txt && \
    pip install -r /tmp/external_requirements.txt && \
    deactivate

RUN virtualenv v4.2 && \
    . v4.2/bin/activate && \
    pip install -r /tmp/requirements.txt && \
    pip install -r /tmp/external_requirements.txt

RUN ln -sf /home/syncano/v4.1/bin/python /usr/bin/python && \
    ln -sf /home/syncano/v4.2/bin/python /usr/bin/python27-42 && \
    ln -sf /home/syncano/v4.1/bin/python /usr/bin/python27-41
# create a special user to run code
# user without root privileges greatly improves security
RUN useradd syncano -d /tmp -s /bin/bash
RUN chmod 1777 /tmp

WORKDIR /tmp
USER syncano
CMD "python"

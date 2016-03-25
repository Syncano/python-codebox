FROM ubuntu:trusty
MAINTAINER "Syncano DevOps Team" <devops@syncano.com>

ENV LAST_REFRESHED 2016-03-25
ENV SYNCANO_APIROOT https://api.syncano.io/

RUN groupadd -r syncano && \
    useradd -u 1000 -r -g syncano syncano -d /tmp -s /bin/bash && \
    mkdir /home/syncano && \
    chown -R syncano /home/syncano

# enable everyone to use /tmp
RUN chmod 1777 /tmp
# -- CUT --

COPY *requirements*.txt /tmp/
COPY *.tar.gz /tmp/

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
    pip install -r /tmp/requirements_base.txt

WORKDIR /home/syncano/
RUN tar xzvf /tmp/42.tar.gz && \
    . v4.2/bin/activate && \
    pip install -r /tmp/requirements_v42.txt && \
    pip install -r /tmp/external_requirements.txt && \
    deactivate

RUN tar xzvf /tmp/50.tar.gz && \
    . v5.0/bin/activate && \
    pip install -r /tmp/requirements.txt && \
    pip install -r /tmp/external_requirements.txt

RUN ln -sf /home/syncano/v4.2/bin/python /usr/bin/python && \
    ln -sf /home/syncano/v5.0/bin/python /usr/bin/python27-lib5.0 && \
    ln -sf /home/syncano/v4.2/bin/python /usr/bin/python27-lib4.2

WORKDIR /tmp
USER syncano
CMD "python"

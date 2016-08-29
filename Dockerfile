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
# -- CUT BEGIN --

COPY *requirements*.txt /tmp/
COPY *.tar.gz /tmp/

RUN apt-get update && apt-get install -qqy \
    git \
    libffi-dev \
    libssl-dev \
    libjpeg-dev \
    python-dev \
    python3-dev \
    python-tk \
    python3-tk \
    python-numpy \
    python3-numpy \
    python-scipy \
    python3-scipy \
    wget && \
    wget https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    pip install -r /tmp/requirements_base.txt

WORKDIR /home/syncano/
RUN virtualenv --system-site-packages v4.2 && \
    tar xzvf /tmp/42.tar.gz --skip-old-files && \
    . v4.2/bin/activate && \
    pip install -r /tmp/requirements_v42.txt && \
    pip install -r /tmp/external_requirements.txt && \
    deactivate

RUN virtualenv --system-site-packages v5.0 && \
    tar xzvf /tmp/50.tar.gz --skip-old-files && \
    . v5.0/bin/activate && \
    pip install -r /tmp/requirements.txt && \
    pip install -r /tmp/external_requirements.txt && \
    deactivate

RUN virtualenv --system-site-packages -p python3 p3v5.0 && \
    . p3v5.0/bin/activate && \
    pip install -r /tmp/requirements_python3.txt && \
    pip install -r /tmp/external_requirements.txt

RUN ln -sf /home/syncano/v5.0/bin/python /usr/bin/python && \
    ln -sf /home/syncano/v5.0/bin/python /usr/bin/python27-lib5.0 && \
    ln -sf /home/syncano/v4.2/bin/python /usr/bin/python27-lib4.2 && \
    ln -sf /home/syncano/p3v5.0/bin/python /usr/bin/python3 && \
    ln -sf /home/syncano/p3v5.0/bin/python /usr/bin/python3-lib5.0

# -- CUT END --
USER syncano
WORKDIR /tmp
CMD "python"

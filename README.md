# python-codebox

This repository containes a Dockerfile for a Python 2.7 container with built in support for syncano and basic python libraries.

You can build a container yourself or pull it from docker registry.

```
$ docker pull quay.io/syncano/python-codebox
$ docker run -it quay.io/syncano/python-codebox
```

In a container you can use syncano library for python:

```
>>> connection = syncano.connect(api_key='my_api_key')
>>> connection.Instance.please.list()
```

By default, syncano library will use staging version of syncano v4.
More info about the library is [here](https://github.com/Syncano/syncano-python/tree/release/4.0).

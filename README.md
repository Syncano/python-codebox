# python-codebox

This repository contains Dockerfile for Python 2.7 image with built-in support for Syncano and selected Python libraries.

You can build the image yourself (Ansible 2.1.0 is required):

```
$ ./create_python_image.sh
```

or pull it from Docker registry:

```
$ docker pull quay.io/syncano/python-codebox
```

Then you can run Docker container:


```
$ docker run -it quay.io/syncano/python-codebox
Python 2.7.6 (default, Jun 22 2015, 17:58:13)
[GCC 4.8.2] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>>
```

In a container you can use Syncano's Python Library:

```
>>> import syncano
>>> connection = syncano.connect(api_key='my_api_key')
>>> connection.Instance.please.list()
```

More info about the library can be found [here](https://github.com/Syncano/syncano-python/).

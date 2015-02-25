# python-codebox

Example source code for using the newest syncano-python library from the inside:

```
>>> connection = syncano.connect(api_key='my_api_key', verify_ssl=False)
>>> connection.Instance.please.list()
```

By default, library will use staging version of syncano v4.

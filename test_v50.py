for lib, version in (('numpy', '1.8.2'), ('scipy', '0.13.3'), ('syncano', '5.4.6')):
    assert __import__(lib).__version__ == version

if __name__ == '__main__':
    import pkgutil
    modules = (name for _, name, is_pkg in pkgutil.iter_modules()
               if is_pkg and name != 'aexol')
    map(__import__, modules)

if __name__ == '__main__':
    import pkgutil
    blacklist = ['winreg']
    modules = (name for _, name, is_pkg in pkgutil.iter_modules()
               if is_pkg and name not in blacklist)
    map(__import__, modules)

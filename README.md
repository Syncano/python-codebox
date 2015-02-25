# python-codebox
Exception:
Traceback (most recent call last):
  File "/home/att/Envs/hoho/local/lib/python2.7/site-packages/pip/basecommand.py", line 122, in main
    status = self.run(options, args)
  File "/home/att/Envs/hoho/local/lib/python2.7/site-packages/pip/commands/install.py", line 257, in run
    InstallRequirement.from_line(name, None))
  File "/home/att/Envs/hoho/local/lib/python2.7/site-packages/pip/req.py", line 172, in from_line
    return cls(req, comes_from, url=url, prereleases=prereleases)
  File "/home/att/Envs/hoho/local/lib/python2.7/site-packages/pip/req.py", line 70, in __init__
    req = pkg_resources.Requirement.parse(req)
  File "/home/att/Envs/hoho/local/lib/python2.7/site-packages/pip/_vendor/pkg_resources.py", line 2611, in parse
    raise ValueError("No requirements found", s)
ValueError: ('No requirements found', '# python-codebox')

Storing debug log for failure in /home/att/.pip/pip.log

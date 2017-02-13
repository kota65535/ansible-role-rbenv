kota65535.rbenv
========

[![Build Status](https://travis-ci.org/kota65535/ansible-role-rbenv.svg?branch=master)](https://travis-ci.org/kota65535/ansible-role-rbenv)

Ansible role for installing [rbenv](https://github.com/sstephenson/rbenv) on RHEL and Ubuntu.

Install it with the following command:

```bash
$ ansible-galaxy install kota65535.rbenv
```

Dependencies
------------

none

Role Variables
--------------

Role variables you may want to change:

* `rbenv_users` - Array of usernames for multiuser install. User must be present in the system
* `rbenv_ruby_versions` - Ruby versions to be installed. You can use 'x' to represent the latest version number.
* `rbenv_root` - Install path of rbenv
* `rbenv_profile_path`: Install path of rbenv initialization script
* `rbenv_plugins` - Array of Hashes with information about plugins to install
* `default_gems_file` - This is Rbenv's plugin _rbenv-default-gems_. Sets the path to a default-gems file of your choice (_don't set it_ if you want to use the default file `files/default-gems`)

You can use `X` as the latest version number to specify ruby version (ex. `2.3.X`).

The default values:

```
rbenv_root: "~/.rbenv"

rbenv_repo: "https://github.com/rbenv/rbenv.git"
rbenv_plugins:
  - name: "rbenv-vars"
    repo: "https://github.com/rbenv/rbenv-vars.git"
  - name: "ruby-build"
    repo: "https://github.com/rbenv/ruby-build.git"
  - name: "rbenv-default-gems"
    repo: "https://github.com/rbenv/rbenv-default-gems.git"
  - name: "rbenv-installer"
    repo: "https://github.com/rbenv/rbenv-installer.git"
  - name: "rbenv-update"
    repo: "https://github.com/rkh/rbenv-update.git"
  - name: "rbenv-whatis"
    repo: "https://github.com/rkh/rbenv-whatis.git"
  - name: "rbenv-use"
    repo: "https://github.com/rkh/rbenv-use.git"
```


Example Playbook
-------------------------

    - hosts: all
      vars:
        rbenv_ruby_versions:
          - 2.0.0
          - 2.3.X
        rbenv_users:
          - test01
          - test02
      roles:
        - kota65535.rbenv


License
-------

MIT

Author Information
------------------

[Tomohiko Ozawa](http://github.com/kota65535)

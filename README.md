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

- ansible >= 2.2.1

Role Variables
--------------

Role variables you may want to change:

* `rbenv_users` - Array of usernames for multiuser install. If not specified, ansible ssh user is used.
* `rbenv_ruby_versions` - Ruby versions to be installed. You can use 'X' to represent the latest version number.
* `rbenv_root` - Install path of rbenv.
* `rbenv_profile_path`: The location of rbenv initialization script.
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


Example Playbooks
-------------------------

### 1. Personal setup

- Install rbenv for me only
- Install ruby 2.1.10 and the latest version of 2.4
- Add lines to ~/.bashrc to initialize pyenv

```
- hosts: all
  vars:
    rbenv_ruby_versions:
      - 2.1.10
      - 2.4.X
    rbenv_profile_path: ~/.bashrc
  roles:
    - kota65535.rbenv
```

### 2. Multiple users, global profile

- Install rbenv for multiple users test01, test02
- Install ruby the latest version of jruby-9
- Crerate /etc/profile.d/rbenv.sh to initialize rbenv for all users

```
- hosts: all
  vars:
    rbenv_ruby_versions:
      - jruby-9.X.X.X
    rbenv_profile_path: /etc/profile.d/rbenv.sh
    rbenv_profile_owner: root
    rbenv_users:
      - test01
      - test02
  roles:
    - kota65535.rbenv
```

### 3. Multiple users, personal profiles

- Install rbenv for multiple users test01, test02
- Install ruby the latest version of jruby-9
- Add lines to ~/.bashrc of each users to initialize pyenv

```
- hosts: all
  vars:
    rbenv_ruby_versions:
      - jruby-9.X.X.X
    rbenv_profile_path: ~/.bashrc
    rbenv_users:
      - test01
      - test02
  roles:
    - kota65535.rbenv
```


License
-------

MIT

Author Information
------------------

[Tomohiko Ozawa](http://github.com/kota65535)

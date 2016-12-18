rbenv
========

Ansible role for installing [rbenv](https://github.com/sstephenson/rbenv).

Install it with the following command:

```bash
$ ansible-galaxy install kota65535.rbenv
```

Role ready status
------------



Dependencies
------------

none


Role Variables
--------------

Role variables you may want to change are:

* `rbenv_users` - Array of usernames for multiuser install. User must be present in the system
* `rbenv.ruby_versions` - Ruby versions to be installed. You can use 'x' to represent the latest version number.
* `rbenv_root` - Install path of rbenv
* `rbenv_profile_path`: Install path of rbenv initialization script
* `rbenv_plugins` - Array of Hashes with information about plugins to install
* `default_gems_file` - This is Rbenv's plugin _rbenv-default-gems_. Sets the path to a default-gems file of your choice (_don't set it_ if you want to use the default file `files/default-gems`)

The default values are:

* `rbenv_users: ["{{ ansible_env.USER }}"]`
* `rbenv_ruby_versions: ["2.x.x"]`
* `rbenv_root: "~/.rbenv"`
* `rbenv_profile_path: "/etc/profile.d/rbenv.sh"`



Example Playbook
-------------------------

    - hosts: all
      vars:
        rbenv_ruby_versions:
          - 2.0.0
          - 2.3.x
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

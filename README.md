# LearningLocker on CentOS7

[Vagrant](https://www.vagrantup.com/) and [Ansible](http://www.ansible.com/) scripts to provision one (or more) [CentOS7](https://www.centos.org/) machines to use [LearningLocker](http://learninglocker.net/). This LearningLocker installation will depend on [Apache2](http://httpd.apache.org/) and [MongoDB](https://www.mongodb.org/).

Note that there is another Vagrant and Ansible script to provision one Ubuntu VM with LearningLocker using [nginx](http://nginx.com/) which can be found [here](https://github.com/rael9/learninglocker-vagrant).

Typical usage
-------------

To create a virtual machine and provision it with LearningLocker, simply run:

    vagrant up


Credits
-------

To create the Ansible playbook, I translated the steps described by [David Pesce](https://gist.github.com/davidpesce) [here](https://gist.github.com/davidpesce/7d6e1b81594ecbc72311).
Therefore, part of the credit goes to him.

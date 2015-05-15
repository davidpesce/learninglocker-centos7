# LearningLocker on CentOS7

[Vagrant](https://www.vagrantup.com/) and [Ansible](http://www.ansible.com/) scripts to provision one (or more) [CentOS7](https://www.centos.org/) machines to use [LearningLocker](http://learninglocker.net/). This LearningLocker installation will depend on [Apache2](http://httpd.apache.org/) and [MongoDB](https://www.mongodb.org/).

Note that there is another Vagrant and Ansible script to provision one Ubuntu VM with LearningLocker using [nginx](http://nginx.com/) which can be found [here](https://github.com/rael9/learninglocker-vagrant).

## Configuration

Copy _vars.secret.yml.edit_ file to  _vars.secret.yml_ and edit it following the instructions detailed in the file.

Optionally, you might want to edit the files located in the _group\_vars_ or _vagrant_ directories.

## Typical usage

In this section I explain three ways to install LearningLocker:

 1. Create one VM machine with LL installed
 2. Create two VM machines with LL installed: one for the webserver and the other for the database.
 3. Install LL in existing machines

### Use case 1. Create one VM machine

To create a virtual machine and provision it with LearningLocker, simply run:

    vagrant up

If the installation is completed successfully, you will be able to:

 * Access LL through your web browser: http://192.168.35.2
 * Connect to the machine: ```vagrant ssh```

### Use case 2. Create two VM machines

To create a virtual machine and provision it with LearningLocker, simply run:

    MACHINES='./vagrant/two_machines' vagrant up

If the installation is completed successfully, you will be able to:

 * Access LL through your web browser: http://192.168.35.3
 * Connect to the machines:
  * ```vagrant ssh ll-web```
  * ```vagrant ssh ll-db```

### Use case 3. Install it in existing machine(s)

For this, you will need to create an inventory file specifying the machines that you will use.


Credits
-------

To create the Ansible playbook, I translated the steps described by [David Pesce](https://gist.github.com/davidpesce) [here](https://gist.github.com/davidpesce/7d6e1b81594ecbc72311).
Therefore, part of the credit goes to him.

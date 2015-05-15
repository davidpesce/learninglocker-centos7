# LearningLocker on CentOS7

This project contains [Vagrant](https://www.vagrantup.com/) and [Ansible](http://www.ansible.com/) scripts to provision one (or more) [CentOS7](https://www.centos.org/) machines to use [LearningLocker](http://learninglocker.net/). This LearningLocker installation will depend on [Apache2](http://httpd.apache.org/) and [MongoDB](https://www.mongodb.org/).

Note that there is another Vagrant and Ansible script to provision one Ubuntu VM with LearningLocker using [nginx](http://nginx.com/) which can be found [here](https://github.com/rael9/learninglocker-vagrant).

## Configuration

Copy _vars.secret.yml.edit_ file to  _vars.secret.yml_ and edit it following the instructions detailed in the file.

Optionally, you might want to edit the files located in the _group\_vars_ or the _vagrant_ directories.

## Typical usage

This section explains three ways to install LearningLocker:

 1. Create one VM machine with LL installed.
 2. Create two VM machines with LL installed: one for the webserver and the other for the database.
 3. Install LL in existing machines.

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

First, you need to create an inventory file specifying the machines that you will use.
The _inventories_ directory contains some sample files which can be used as inventory templates.

Then, run Ansible as follows.

    ansible-playbook --private-key=[path_to_private_key] --user=[remote_user] -i [path_to_inventory_file] main.yml

If the MongoDB will not run in the same machine as the web server, you should specify it in the following way:

    ansible-playbook --extra-vars={"mongodb_host":"[ip-of-the-machine]"} (...)

To provision only the web server run:

    ansible-playbook (...) learninglocker.yml

To provision only the database run:

    ansible-playbook (...) database.yml


# Acknowledgements

This playbook was made as part of the [FORGE project](http://ict-forge.eu/).

To create the Ansible playbook, the steps described by [David Pesce](https://gist.github.com/davidpesce) [here](https://gist.github.com/davidpesce/7d6e1b81594ecbc72311) were a great help.
Therefore, part of the credit goes to him.

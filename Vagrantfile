# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"


box = "chef/centos-7.0"
memory = 1024


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

	config.vm.provision "ansible" do |ansible|
		ansible.groups = {
			"learninglocker" => ["machine"],
			"database" => ["machine"],
			"local:children" => ["learninglocker", "database"]
		}
		ansible.playbook = "main.yml"
		# Useful during testing 
		ansible.host_key_checking = false
		# ansible.verbose = "vvvv"
		# ansible.inventory_path = "path"  # In this case we directly generate it
		# ansible.limit = "local"
		# ansible.raw_arguments = "--ask-vault-pass"
	end


	# Disabling the default /vagrant share.
	#   http://docs.vagrantup.com/v2/synced-folders/
	#   (Reason to disable it: In MacOS GuestAdditions trend to fail screwing the "up" or "reload".
	config.vm.synced_folder ".", "/vagrant", disabled: true

	config.vm.define "machine" do |node|
		node.vm.box = box
		node.vm.network "private_network", ip: "192.168.35.2"
		node.vm.network "forwarded_port", guest: 80, host: 8082
		node.vm.hostname = "learninglocker"
		node.vm.provider :virtualbox do |vb|
			vb.memory = memory
		end
	end
end


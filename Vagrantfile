Vagrant.configure("2") do |config|

  config.vm.define "nomad-dev" do |n|
    n.vm.box = "generic/ubuntu2004"
    n.vm.network "forwarded_port", guest: 80, host: 8080
    n.vm.network "forwarded_port", guest: 2375, host: 2375
		for i in 8981..8983
			config.vm.network :forwarded_port, guest: i, host: i
    end
		for i in 2981..2983
			config.vm.network :forwarded_port, guest: i, host: i
    end
		for i in 7001..7003
			config.vm.network :forwarded_port, guest: i, host: i
    end
		n.vm.synced_folder "/mnt/c/dev/", "/home/vagrant/dev"
    n.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
    end
    # n.vm.provision "shell", path: "bootstrap.sh"
    n.vm.provision "ansible" do |ansible|
      ansible.verbose = "v"
      ansible.playbook = "ansible/main.yml"
      ansible.tags = "docker"
      ansible.config_file = "ansible/ansible.cfg"
    end
  end

end

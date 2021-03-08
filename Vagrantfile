Vagrant.configure("2") do |config|

  config.vm.define "nomad-dev" do |n|
    n.vm.box = "generic/ubuntu2004"
    n.vm.network "forwarded_port", guest: 80, host: 8080
    n.vm.synced_folder "/mnt/d/dev/", "/home/vagrant/dev"
    n.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
    end
    # n.vm.provision "shell", path: "bootstrap.sh"
    n.vm.provision "ansible" do |ansible|
      ansible.verbose = "v"
      ansible.playbook = "ansible/main.yml"
      ansible.tags = "nomad"
      ansible.config_file = "ansible/ansible.cfg"
    end
  end

end

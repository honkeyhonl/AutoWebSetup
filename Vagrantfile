Vagrant.configure("2") do |config|
  config.vm.define "scriptbox" do |scriptbox|
    scriptbox.vm.box = "eurolinux-vagrant/centos-stream-9"
    scriptbox.vm.network "private_network", ip: "192.168.10.12"
    scriptbox.vm.hostname = "scriptbox"
    scriptbox.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
    end
    # Provisioning with bash script
    scriptbox.vm.provision "shell", path: "3_args_websetup.sh"
  end
end

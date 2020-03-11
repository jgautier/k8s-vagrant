IMAGE_NAME = "bento/ubuntu-19.10"
N = Integer(ENV.fetch('NODE_COUNT', 1))

Vagrant.configure("2") do |config|
    config.ssh.insert_key = false

    config.vm.provider "virtualbox" do |v|
        v.memory = 2048
        v.cpus = 2
    end
      
    config.vm.define "k8s-master" do |master|
        master.vm.box = IMAGE_NAME
        master.vm.network "private_network", ip: "192.168.50.10"
        master.vm.hostname = "k8s-master"
        master.vm.provision "shell", path: "provision-master.sh"
    end

    (1..N).each do |i|
        config.vm.define "node-#{i}" do |node|
            node.vm.box = IMAGE_NAME
            node.vm.network "private_network", ip: "192.168.50.#{10 + i}"
            node.vm.hostname = "node-#{i}"
            node.vm.provision "shell", path: "provision-worker.sh"
        end
    end
end
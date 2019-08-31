# -*- mode: ruby -*-
# vi: set ft=ruby :

ip = '192.168.96.100'
cpus = 2
memory = 1024 * 10

def fail_with_message(msg)
  fail Vagrant::Errors::VagrantError.new, msg
end

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.box_url = "https://cloud-images.ubuntu.com/bionic/current/bionic-server-cloudimg-amd64-vagrant.box"
  config.vm.network :private_network, ip: ip, hostsupdater: 'skip'
  config.vm.hostname = 'spark-cluster-via-docker.local'
  config.disksize.size = '30GB' # vagrant plugin install vagrant-disksize

  config.vm.synced_folder ".", "/vagrant", disabled: false
    
  config.vm.provider 'virtualbox' do |vb|
    vb.name = config.vm.hostname
    vb.customize ['modifyvm', :id, '--cpus', cpus]
    vb.customize ['modifyvm', :id, '--memory', memory]

    # Fix for slow external network connections
    vb.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
    vb.customize ['modifyvm', :id, '--natdnsproxy1', 'on']
  end

  config.vm.provision "shell", path: "vagrant/provision.sh", privileged: false
end
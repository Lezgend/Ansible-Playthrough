Vagrant.configure(2) do |config|

  # Use shell provision for setting thing up
  USERNAME = "root"
  PASSWORD = "pass"
  config.vm.provision "shell", path: "install.sh", :args => [USERNAME, PASSWORD]

  # Define the number of VMs to create
  NodeCount = 4

  # Define the list of IP addresses to use
  ips = ["192.168.56.10", "192.168.56.20", "192.168.63.10", "192.168.63.20"]

  (1..NodeCount).each do |i|

    config.vm.define "alpine#{i}" do |node|

      # Create a VM with Alpine Linux 3.17.2
      node.vm.box               = "generic/alpine317"
      node.vm.box_check_update  = false
      node.vm.hostname          = "alpine#{i}.example.com"

      # Set SSH username and password
      # node.ssh.username = "vagrant"
      # node.ssh.password = "vagrant"
      # node.ssh.insert_key = false

      # Configure a static IP address for the VM
      node.vm.network "private_network", ip: ips[i-1]

      # Set the number of CPUs, RAM, and cores
      node.vm.provider :virtualbox do |v|
        v.name    = "alpine#{i}"
        v.memory  = 512
        v.cpus    = 1
      end

      node.vm.provider :libvirt do |v|
        v.nested  = true
        v.memory  = 512
        v.cpus    = 1
      end

    end

  end

end
# Allocate all CPU cores to the VM
if RbConfig::CONFIG['host_os'] =~ /darwin/
    CPUS = `sysctl -n hw.ncpu`.to_i
elsif RbConfig::CONFIG['host_os'] =~ /linux/
    CPUS = `nproc`.to_i
else  # Windows 🤞
    CPUS = `wmic cpu get NumberOfCores`.split("\n")[2].to_i
end

RAM_MB = 4096
# CPUS = 8  # Or override manually if you want

Vagrant.configure("2") do |cfg|
    cfg.vm.box = "aspyatkin/ubuntu-20.04-server"
    cfg.vm.provision "shell", path: "setup.sh"

    vm_name = "docker-vm"
    cfg.vm.define vm_name do |s|
        s.vm.network "private_network", ip: "172.25.25.25"
        s.vm.hostname = vm_name

        s.vm.provider "virtualbox" do |vbox|
            vbox.name = vm_name
            vbox.customize ["modifyvm", :id, "--memory", RAM_MB]
            vbox.customize ["modifyvm", :id, "--cpus", CPUS]
            vbox.customize ["modifyvm", :id, "--cpuexecutioncap", 75]
            vbox.customize ["modifyvm", :id, "--ioapic", "on"]
        end
    end
end

# Easy Docker VM

## Why?

Because Docker is kind of painful at times. On Windows you can run Docker via Hyper-V and get terrible performance and be blocked from using VirtualBox and other actually good virtualization solutions.

This makes it super easy to set up a working Docker environment on any platform, Windows, Linux, or Mac.


## How?

Pre-requisites:

 - [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
 - [Vagrant](https://www.vagrantup.com/downloads)

We use Vagrant to automate a VirtualBox VM based on Ubuntu 20.04, install and enable the Docker daemon on it, then enable access to it via the private local IP `172.25.25.25`

Download/clone the contents of this repository, open up a terminal to the directory, and run:

```
vagrant up
```

Once that finishes (takes a couple of minutes typically) you can then test the connection:

On Linux/Mac
```
DOCKER_HOST=tcp://172.25.25.25:2375 docker run --rm -it alpine
```

On Windows
```
set DOCKER_HOST=tcp://172.25.25.25:2375
docker run --rm -it alpine
```

If it works you should get a command prompt, you can type in `exit` or press `Ctrl+D` to close it.

To make this permanent you should append to your environment the `DOCKER_HOST=tcp://172.25.25.25:2375` variable permanently, and whenever you want to use Docker just `vagrant up` in that folder in advance. You can also autostart the VirtualBox VM if you wish.


## Configuration

You can edit the `Vagrantfile` if you wish to tweak the `CPUS` variable or `RAM_MB` to define how much resources your VM should use. I set what I thought were pretty reasonable defaults (4GB RAM, all CPU cores available up to 75% capacity), you might disagree on them.


## Other reading

 - [Autostart VirtualBox VM on Ubuntu 20.04](https://www.paulligocki.com/make-virtual-box-vm-autostart/)
 - [Autostart VirtualBox VM on Windows 10](https://superuser.com/a/1645276/733788)
 - [Autostart VirtualBox VM on Mac](https://ma.ttias.be/auto-start-virtualbox-vms-headless-after-reboot-on-mac-osx/)
 - [Set up environment variables in Windows 10](https://phoenixnap.com/kb/windows-set-environment-variable)


## License

Everything in this repository is licensed under the BSD 3-clause -license.


# Financial support

This project has been made possible thanks to [Cocreators](https://cocreators.ee) and [Lietu](https://lietu.net). You can help us continue our open source work by supporting us on [Buy me a coffee](https://www.buymeacoffee.com/cocreators).

[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/cocreators)

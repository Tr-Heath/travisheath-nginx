# travisheath - nginx

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with nginx](#setup)
    * [Beginning with nginx](#beginning-with-nginx)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

This a learning exercise to become more experiences with Puppet configuration management.
The requirements are to install on to a CentOS node the nginx web server. 

It should serve the contents of https://github.com/puppetlabs/exercise-webpage/blob/master/index.html
over port 8000. 

The module should be able to be applied multiple times.

## Setup

If you are going to use Vagrant to test, ensure that it is installed along with VirtualBox and the following plugins:
vagrant plugin install vagrant-vbguest
vagrant plugin install vagrant-hostmanager

Also take note of how much memory your host environment has. In the vagrantfile, the memory size has been set to 2048MB, more than the Vagrant defaults. Puppetserver has also been dropped to 512MB from 2GB, so that the VM can still operate. 

### Beginning with nginx

This is expected to be run on CentOS. Either you can clone the project and then 
use the Vagrantfile to create a CentOS environment, which is how I tested the project,
or clone the project onto an existing CentOS installation.

Steps I took:
	* Pull down latest from github onto a machine with VirtualBox and Vagrant installed.
	* Change directory to {your_path}/vagrant
	* As the su, run vagrant up.
		This will download - and spin up - a CentOS 7.2 instance.
	* If you intend to do any development, there are some symlink tasks that I have in provisioning that I found beneficial in workflow. More details in the Development section.
	* You can connect to the instance with the command: vagrant ssh puppet
	* cd /etc/puppetlabs/code/environment/production/modules/nginx/examples/
	* puppet apply init.pp

## Limitations

This has been tested for CentOS only, although could easily be extended to RHEL by adding the official repo to /files
and then commenting back in the section of the case statement in install.pp that checks for operating system.

## Development

After learning about how to use Vagrant it was excellent to work with after implementing the use of symlinks between the default 
/vagrant linked directory and the working directory on my development environment.

Please make a note of the vagrantfile and link to the directories you prefer.  



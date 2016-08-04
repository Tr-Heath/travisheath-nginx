#!/bin/bash
# Due to inconsistent execution of the provision shell script in the vagrantfile.
# This script may need to be run if you ssh to the test box with no dependencies 
# installed.
# Usage: chmod u+x provision.sh
#        ./provision.sh  

      # sudo yum update -y
      sudo rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
      sudo yum install puppetserver -y
      sudo yum install ruby -y
      sudo rm -rf /etc/puppetlabs/code
      sudo ln -s /puppet_code /etc/puppetlabs/code
      sudo sed -i 's/2g/512m/g' /etc/sysconfig/puppetserver
      sudo service puppetserver start
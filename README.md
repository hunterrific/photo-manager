# Vagrant Boilerplate

project name: vagrant-boilerplate

##Description

This is a basic Vagrant configuration for me to use on all my projects.  I didn't want to use the default Vagrantfile Vagrant generates because my custom Vagrantfile allows me to do a few things that I find helpful:

1. The VM box name and the memory allocated allocated can be read from the command line so that they can be changed when necessary without ahving to edit the Vagrantfile.  This is especially useful if I want to test something quickly.  For example, if the VM is having problems, I can quickly change the amount of memory allocated to see if that helps.  If the box name is not specified, it defaults to Ubuntu 16.04 LTS.  If the memory allocation is not specified, it defaults to 512 MB.
2.  Most of the projects I have in mind will involve a web interface.  My Vagrantfile specifies the port that the web server will be running on in the VM and the port it forwards to.  Something to note is that Vagrant/Virtualbox will not forward ports below 1024, so the web browser will need to use a port other than 80.  On the other hand, it is possible to have the web server run on port 80 in the VM, and map that to port 8080 (for example).
3.  Rather than adding complexity by using something something like Ansible, I prefer to provision my development boxes usnig a shell script.  I find a few benefits to doing it this way:
  1. I can bring up a clean Ubuntu 16.04 box, then use the command line to configure the VM and install software.  When it gets to a point where I'm satisfied, I can quickly review everything that's done in the history and put that in the shell script.
  2. If I need to change the way the VM is provisioned, it's a lot easier for me to change the file.
  3. I can use source control to manage the versions of the shell script.
  4. Once I'm satisfied with how everything is working, I can decide if I want to use something like Ansible.  For now, the answer is probably 'no' since these projects will be for my own perosnal use.
4. The Vagrantfile syncs an additional '/data' folder so that not all the data has to be kept in project.

Just something simple I can clone to get started on my projects a bit more quickly.

##Usage

1. Install Virtalbox
2. Install Vagrant
3. Clone project
4. cp vagrant/Vagrantfile.default to ./Vagrantfile
5. Update 'vagrant.provision.sh' if needed
  1. Probably a good idea to run 'apt update' and 'apt upgrade' at a minimum.
6. vagrant up


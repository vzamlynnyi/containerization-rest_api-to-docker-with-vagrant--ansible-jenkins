#Vagrant Ansible and jenkins profile for Docker with Python rest api.

Getting Started

This README file is inside a folder that contains a Vagrantfile, which tells Vagrant how to set up your virtual machine in VirtualBox.

To use the vagrant file, you will need to have done the following:

Download and Install VirtualBox
Download and Install Vagrant
Install Ansible
Open a shell prompt
Run the following command to install the necessary Ansible roles for this profile: $ ansible-galaxy install -r requirements.yml
Once all of that is done, you can simply type in vagrant up, and Vagrant will create a new VM, install Jenkins with plugins and Docker,configure jenkins job and run it.
After that Docker container will be created and pushed to Docker Hub.
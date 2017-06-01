# Workshed #

This repo contains a Vagrantfile and bootstrap script and files to provision a 'workshed' virtual machine where you can work on AWS resources.

The tools bootstrapped into the workshed are:

 - [AWS CLI](https://aws.amazon.com/cli) - Amazon Web Services
 - [AWS Elastic Beanstalk CLI](http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb-cli3-install.html) - Amazon Web Services
 - [Axe](https://bitbucket.org/kxseven/axe) (The Cloud Hatchet) - Hugh Mooney
 - [SAWS](https://github.com/donnemartin/saws) (Supercharged AWS CLI) - Donne Martin
 - [Ansible](https://www.ansible.com/) - Red Hat
 - [Docker](https://www.docker.com) - Docker Inc.
 - [Terraform](https://www.terraform.io) - Hashicorp
 - [S3cmd](http://s3tools.org) - s3tools.org
 - [dotvim](https://bitbucket.org/JosephHolland_/dotvim) (customised vim install) - Joseph Holland
 - [Terraforming](https://github.com/dtan4/terraforming) (Export existing AWS resources to Terraform style: tf, tfstate) - Daisuke Fujita

## Install ##

### Pre-requisites ###

 - BIOS virtualisation enabled (Intel VT or AMD-V)
 - [VirtualBox](https://www.virtualbox.org/wiki/Downloads) - Oracle (install the Oracle VM VirtualBox Extension Pack too)
 - [Vagrant](https://www.vagrantup.com/downloads.html) - Hashicorp
 - Git

### Building the workshed ###

 1. Open command line and clone this repo

    ```
    git clone https://github.com/joseph-holland/workshed.git
    ```

 2. Change directory into the workshed and vagrant up

    ```
    cd workshed
    vagrant up
    ```

 3. The virtual machine will take about 5-10 minutes to fully provision after which you will be able to ssh into it

    ```
    vagrant ssh
    ```

### Contributing ###

 1. Fork it ( https://github.com/joseph-holland/workshed/fork )
 2. Create your feature branch (git checkout -b my-new-feature)
 3. Commit your changes (git commit -am 'Add some feature')
 4. Push to the branch (git push origin my-new-feature)
 5. Create a new Pull Request
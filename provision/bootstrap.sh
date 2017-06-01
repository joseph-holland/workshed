#!/bin/bash

TERRAFORM_VERSION="0.9.5"

echo "Upgrading installed packages..."
sudo yum makecache fast
sudo yum upgrade -y

echo "Installing packages..."
sudo yum install -y epel-release
sudo yum makecache fast
sudo yum groupinstall "Development Tools" -y && sudo yum install kernel-devel -y
sudo yum install -y yum-utils xorg-x11-xauth xorg-x11-apps ntp unzip wget curl \
curl tree xclip tmux screen lynx elinks nano vim git ncftp lftp rsync ncdu pv \
dstat mtr multitail nmap dstat lsof htop iftop iotop glances mlocate findutils \
moreutils autoconf gmp-devel gdbm-devel ncurses-devel automake libtool bison jq \
colordiff s3cmd figlet rubygems krb5-devel krb5-workstation libffi-devel \
openssl-devel python-devel python-gssapi python-kerberos python-crypto \
python-virtualenv PyYAML python-requests-kerberos plymouth-system-theme \ 
plymouth-plugin-label libyaml libyaml-devel sqlite-devel sqlite

echo "Creating super cool MOTD..."
figlet -ctf banner 'welcome' | sudo tee -a /etc/motd
figlet -ctf banner 'to the' | sudo tee -a /etc/motd
figlet -ctf banner 'workshed' | sudo tee -a /etc/motd
echo "PrintMOTD yes" | sudo tee -a /etc/ssh/sshd_config
sudo systemctl restart sshd.service

echo "Installing python and pip..."
wget -q https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py
sudo pip install --upgrade pip
sudo pip install --upgrade setuptools
sudo pip install json2yaml mkdocs pbr pyyaml future
sudo pip install virtualenv virtualenvwrapper
rm get-pip.py

echo "Configuring python virtualenv stuff..."
sudo pip install virtualenvwrapper
cat << EOF >> ~/.bashrc
export WORKON_HOME=~/.virtualenvs
export PROJECT_HOME=~
source /usr/bin/virtualenvwrapper.sh
EOF
source /usr/bin/virtualenvwrapper.sh
mkvirtualenv axe
workon axe

pip install --upgrade pip
pip install --upgrade setuptools
pip install --upgrade virtualenvwrapper

echo "Setting up directory structure..."
mkdir ~/bin
mkdir ~/tools
chmod +x ~/bin/*

echo "Configuring bash..."
cat << 'EOF' >> ~/.bashrc
. ~/etc/bash/bashrc
EOF

echo "Installing axe..."
git clone https://bitbucket.org/kxseven/axe.git ~/tools/axe
mkdir -p ~/tools/axe/local
ln -s ~/.virtualenvs/axe ~/tools/axe/local/python
pip install -r ~/tools/axe/requirements_py.txt
cat << EOF >> ~/.bashrc
export AXE_ROOT=~/tools/axe
export PATH=$PATH:~/bin:~/tools/axe/bin
EOF

echo "Installing awscli and awsebcli..."
pip install awscli
pip install awsebcli

echo "Installing saws..."
pip install saws

echo "Installing terraforming..."
gem install terraforming

echo "Installing ansible..."
sudo yum install  -y ansible

echo "Installing docker..."
sudo mkdir /var/lib/docker
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum makecache fast
sudo yum -y install docker-ce
sudo usermod -G docker vagrant

echo "Installing terraform..."
wget -q https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
&& sudo unzip -o terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin \
&& rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

echo "Customising vim..."
git clone https://bitbucket.org/JosephHolland_/dotvim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
cd ~/.vim
git submodule update --init

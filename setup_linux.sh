#!/bin/bash
#Install git-core before running this file to pull from repo
#sudo apt-get install -y git-core
# Set caps_lock = ctrl, alt = alt, meta in keyboard layout

git config --global user.name "drk1984"
git config --global user.email "darshankadia@gmail.com"

####### Programming languages & Linux tools ###########
sudo apt-get install -y openssh-server
mkdir -p ~/.ssh # create .config file for remote hosts in this directory
sudo apt-get install -y curl
sudo apt-get install -y python-software-properties python
#sudo apt-get install -y g++ 
#sudo apt-get install -y make
sudo apt-get install -y locate
sudo apt-get install -y screen

sudo apt-get install -y vim # Installs vi editor if necessary

#Install emacs after purging any existing versions
# https://launchpad.net/~cassou/+archive/emacs
sudo apt-get update
sudo apt-get install
sudo apt-get purge emacs emacs-snapshot-common emacs-snapshot-bin-common emacs-snapshot emacs-snapshot-el emacs-snapshot-gtk emacs23 emacs23-bin-common emacs23-common emacs23-el emacs23-nox emacs23-lucid auctex apel emacs24 emacs24-bin-common emacs24-common emacs24-common-non-dfsg emacs-el
sudo add-apt-repository ppa:cassou/emacs
sudo apt-get update
sudo apt-get install -y emacs24 emacs24-el emacs24-common-non-dfsg
# If using .emacs.d customizations, make sure to rm ~/.emacs
############ X ###############


####### Web tools ############
# Install Heroku toolbelt
# https://toolbelt.heroku.com/debian
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

#Install node/nvm & node repl
curl https://raw.github.com/creationix/nvm/master/install.sh | sh 
source $HOME/.nvm/nvm.sh
nvm install v0.10.24
nvm use v0.10.24
sudo apt-get install -y rlwrap # this is read-line node repl

# Check if npm install is really necessary after doing node install through nvm
sudo apt-get install -y npm
npm config set registry http://registry.npmjs.org/
sudo npm install -g jshint # what is the implication of -g global
sudo npm install async sleep twit
sudo npm install restler accounting csv

# To ensure clean nvm installation, remove following from 
# .profile & put into .bashrc
#[ -s $HOME/.nvm/nvm.sh ] && . $HOME/.nvm/nvm.sh 
######### X ##############


####### User Customizations #######
git clone https://github.com/drk1984/dotfiles.git
#Link all dotfiles from ~ to /dotfiles directory using ln -sb
# If using .emacs.d customizations, make sure to rm ~/.emacs
cd $HOME

ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .

if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d~
fi
rm -f .profile
rm -f .emacs

ln -sf dotfiles/.emacs.d .

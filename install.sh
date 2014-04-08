#!/bin/sh
#Edited by Jie Feng
#~/install/installVim.sh
mkdir ~/generated

#push.sh setup
gpg --output ~/generated/push.sh  --decrypt ~/install/push.sh.gpg
chmod a+x ~/generated/push.sh

#PPA
sudo apt-add-repository ppa:thefanclub/grive-tools
sudo add-apt-repository ppa:atareao/atareao #google calendar
sudo add-apt-repository ppa:nvbn-rm/ppa #everpad

sudo apt-get update

#Python setup
sudo apt-get install python-pip 
sudo pip install urllib2

#Install softwares
sudo apt-get install vim vim-gnome tomboy exuberant-ctags\
    git expect gparted \
    artha dict goldendict goldendict-wordnet \
    vlc-nox gimp apcalc\
    figlet\
    apt-file unrar\
    iftop bmon\
    calendar-indicator\
    everpad tmux\
    libreadline6 libreadline6-dev\
    libncurses5-dev\
    ack

#Tex/Latex installing
sudo apt-get install texlive-full evince texmaker

#All yes
sudo apt-get install -y grive-tools

#Developing
sudo apt-get install cmake  bzr build-dep unity nux gnome-common libibus-1.0-dev libgtest-dev google-mock libxtst-dev libmrss0 

#Lamp
sudo apt-get install tasksel rake
sudo tasksel install lamp-server
sudo apt-get install php5-cgi
#Git setup
git config --global core.excludesfile ~/.gitignore_global
git config --global user.email "jokerfeng2010@gmail.com"
git config --global user.name "Jie Feng"
git config --global push.default simple

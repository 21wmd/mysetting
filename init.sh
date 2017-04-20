#!/bin/bash

# 部署坚果云

sudo apt-get install sudo apt-get install glib2.0-dev gtk2.0-dev libnautilus-extension-dev gvfs-bin openjdk-8-jre-headless -y

wget http://www.jianguoyun.com/static/exe/installer/nutstore_linux_src_installer.tar.gz

tar zxf nutstore_linux_src_installer.tar.gz
cd nutstore_linux_src_installer/
./configure
make
sudo make install
./runtime_bootstrap

# 部署oh-my-zsh
sudo apt-get install zsh -y
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"


# 部署 PowerLine

sudo apt-get install -y libxrandr-dev libxrandr2 python-psutil git python3-psutil python-hglib python3-hglib python-pygit2 python3-pygit2 python-bzrlib bzr libuv1-dev python-pip

sudo pip install --upgrade pip
pip install pyuv i3ipc xrandr powerline-status

wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf

mkdir ~/.fonts
mkdir ~/.config/fontconfig/conf.d/

mv PowerlineSymbols.otf ~/.fonts/
fc-cache -vf ~/.fonts/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
git clone https://github.com/powerline/fonts.git
cd fonts
./install

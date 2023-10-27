#!/bin/bash

dir=$(pwd)

cd ~

sudo pacman -Syu
sudo pacman -S vim git libxcb xcb-util xcb-util-wm xcb-util-keysyms gdm xorg xorg-xinit polybar xterm rofi feh tmux chromium--noconfirm

git clone https://github.com/baskerville/bspwm.git
git clone https://github.com/baskerville/sxhkd.git

mkdir -p ~/.config/{bspwm,sxhkd,polybar}
mkdir ~/.config/bspwm/scripts
mkdir ~/pictures ~/pictures/wallpaper.jpg

cd bspwm && make && sudo make install
cd ../sxhkd && make && sudo make install

cp $dir/bspwmrc ~/.config/bspwm/
cp $dir/bspwmrc_resize ~/.config/bspwm/scripts
cp $dir/sxhkdrc ~/.config/sxhkd/
cp $dir/launch.sh ~/.config/polybar/
cp $dir/config.ini ~/.config/polybar/
cp $dir/wallpaper.jpg

cp /etc/X11/xinit/xinitrc ~/.xinitrc


echo "exec bspwm" >> ~/.xinitrc

chmod u+x ~/.config/bspwm/bspwmrc
chmod +x ~/.config/polybar/launch.sh


# Optional

cd ~
git clone https://github.com/lr-tech/rofi-themes-collection.git
cd rofi-themes-collection
mkdir -p ~/.local/share/rofi/themes/
cp themes/rounded-common.rasi ~/.local/share/rofi/themes/
cp themes/rounded-blue-dark.rasi ~/.local/share/rofi/themes/
cd ~
mkdir fonts
cd fonts
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hack.tar.xz
tar -xvf Hack.tar.xz
mkdir -p ~/.local/share/fonts
cp *.ttf ~/.local/share/fonts/.


sudo systemctl enable gdm


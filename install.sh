#!/bin/bash

dir=$(pwd)

cd ~

sudo pacman -Syu
sudo pacman -S vim git libxcb xcb-util xcb-util-wm xcb-util-keysyms lightdm lightdm-gtk-greeter xorg xorg-xinit polybar xterm rofi feh --noconfirm

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
cp $dir/wallpaper.jpg

cp /etc/X11/xinit/xinitrc ~/.xinitrc
cp /etc/polybar/config.ini ~/.config/polybar/

echo "exec bspwm" >> ~/.xinitrc

chmod u+x ~/.config/bspwm/bspwmrc
chmod +x ~/.config/polybar/launch.sh

sudo systemctl enable lightdm
sudo reboot
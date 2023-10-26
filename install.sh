#!/bin/bash

cd ~
sudo pacman -Syu
sudo pacman -S vim git libxcb xcb-util xcb-util-wm xcb-util-keysyms gdm xorg xorg-xinit polybar --noconfirm
git clone https://github.com/baskerville/bspwm.git
git clone https://github.com/baskerville/sxhkd.git
cd bspwm && make && sudo make install
cd ../sxhkd && make && sudo make install
mkdir -p ~/.config/{bspwm,sxhkd,polybar}
cd ../bspwm/examples
cp bspwmrc ~/.config/bspwm/
cp sxhkdrc ~/.config/sxhkd/
chmod u+x ~/.config/bspwm/bspwmrc
cp /etc/X11/xinit/xinitrc ~/.xinitrc
echo "exec bspwm" >> ~/.xinitrc
cp /etc/polybar/config.ini ~/.config/polybar/
sudo systemctl enable gdm
sudo reboot

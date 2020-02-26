#!/bin/bash

sudo dpkg --list 'linux-image*'|awk '{ if ($1=="ii") print $2}'|grep -v `uname -r` > old-kernel-list.txt
cat old-kernel-list.txt | 2cmd kernelcleanup.2cmd
sudo apt-get -f install
sudo apt-get autoremove
sudo update-grub
sudo apt-get update

### OR: sudo dpkg --list 'linux-image*'|awk '{ if ($1=="ii") print $2}'|grep -v uname -r | while read -r line; do sudo apt-get -y purge $line;done;sudo apt-get autoremove; sudo update-grub

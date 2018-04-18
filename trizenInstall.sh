#!/bin/bash
trizenInstall() {
  printf "${GREEN}Checking for Trizen..."
  if ! pacman -Q trizen >/dev/null 2>&1
  then
    printf "${BLUE}Cloning Trizen..."
    git clone https://aur.archlinux.org/trizen.git >/dev/null 2>&1
    cd trizen
    makepkg -sic
    cd ..
    rm -rf trizen
  fi
}
trizenInstall

#!/bin/bash
main () {
  # Place all files here
  # if they are located in the .config file include this
  # in their path
  declare -a configs=(
    ".eslintrc"
    ".prettierrc"
    ".psqlrc"
    ".stylelintrc"
    ".zshrc"
    ".config/kitty"
    ".config/fontconfig"
  )

  # Add any packages from the official repos or AUR here
  declare -a packages=(
    "pkgfile"
    "zsh-syntax-highlighting"
    "zsh"
    "neovim"
    "kitty"
    "archey4"
    "lolcat"
  )


  JCONF=$(pwd) # Get the current working directory

  # Colors
  if which tput >/dev/null 2>&1; then
    ncolors=$(tput colors)
  fi
  if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
      RED="$(tput setaf 1)"
      GREEN="$(tput setaf 2)"
      YELLOW="$(tput setaf 3)"
      BLUE="$(tput setaf 4)"
      PURPLE="$(tput setaf 5)"
      BOLD="$(tput bold)"
      NORMAL="$(tput sgr0)"
    else
      RED=""
      GREEN=""
      YELLOW=""
      BLUE=""
      PURPLE=""
      BOLD=""
      NORMAL=""
  fi

  # Check for Trizen!
  source $JCONF/trizenInstall.sh

  # Handle Packages
  source $JCONF/packageInstall.sh

  # Helper Functions!
  function moveExisting {
    # Expects full path as arg
    if [ -r "$1" ]
    then
      mv $1 "$1"_old
      printf "${BLUE}$1 has been moved to ${1}_old"
    fi
  }
  function removeExisting {
    # Expects full path as arg
    if [ -d "$1" ]
    then
      rm -r $1
      echo "${RED}$1 has been removed"
    elif [ -r "$1" ]
    then
      rm $1
      echo "${RED}$1 has been removed"
    fi
  }
  function linkConfigs {
    if [ ! -r "$HOME/$1" ]
    then
      ln -s $JCONF/$1 $HOME/$1
    fi
  }

  # Prompt User for what they would like done with their old config files
  printf "${GREEN}Would you like to move, remove, or leave any existing config files?\n"
  select response in "Move" "Remove" "Leave"; do
      case $response in
          Move )
            for i in "${configs[@]}"
            do
              moveExisting "$HOME/$i"
            done
            break;;
          Remove ) 
            for i in "${configs[@]}"
            do
              removeExisting "$HOME/$i"
            done
            break;;
          Leave ) break;;
      esac
    done

  for i in "${configs[@]}"
  do
    linkConfigs "$i"
  done

  if [ ! -d "$HOME/.oh-my-zsh/" ]
  then
    source $JCONF/ohMyZshInstall.sh
  fi

  printf "${PURPLE}"
  echo '       __                         ______            _____           '
  echo '      / /___ _________  __  __   / ____/___  ____  / __(_)___ ______'
  echo ' __  / / __ `/_  /_  / / / / /  / /   / __ \/ __ \/ /_/ / __ `/ ___/'
  echo '/ /_/ / /_/ / / /_/ /_/ /_/ /  / /___/ /_/ / / / / __/ / /_/ (__  ) '
  echo '\____/\__,_/ /___/___/\__, /   \____/\____/_/ /_/_/ /_/\__, /____/  '
  echo '                     /____/                           /____/         ... are now installed!'

  env zsh
}
main

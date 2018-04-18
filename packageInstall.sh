#!/bin/bash
packageInstall() {
  declare -a neededPackages=()

  printf "${BLUE}Checking Needed Packages...\n"
  for i in "${packages[@]}"
  do
    if ! trizen -Q $i > /dev/null 2>&1
    then
      neededPackages+=("$i")
    fi
  done
  if [ ! ${#neededPackages[@]} -eq 0 ]; then
  trizen -S $neededPackages
  fi
}
packageInstall

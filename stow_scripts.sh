#!/bin/bash
set -o xtrace

source functions.sh

logo

basic_help "$(basename $0)" \
  "This script creates the scripts files in the arma 3 dedicated server folder for better management" \
  "[arma3server_absolute_folder_path]" \
  $@

check_parameter $1

# stow creates the synlinks from all files in this project to the server folder
stow arma3server -d $(pwd)/.. -t $1

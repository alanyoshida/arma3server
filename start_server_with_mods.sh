#!/bin/bash
#set -o xtrace
source functions.sh

logo

basic_help "$(basename $0)" \
  "This script start the arma server with mods" \
  "[arma3server_folder_path] [mods_file]" \
  $@

check_parameter $1
check_parameter $2

start_server_with_mods $1 $2

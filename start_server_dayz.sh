#!/bin/bash
#set -o xtrace

source functions.sh

logo

basic_help "$(basename $0)" \
  "This script start the arma server with dayz mods" \
  "[arma3server_folder_path]" \
  $@

check_parameter $1

start_server_with_mods $1 "\"$(get_mods mods/dayz_mods)\""

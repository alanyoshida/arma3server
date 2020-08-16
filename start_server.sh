#!/bin/bash

source functions.sh

logo

basic_help "$(basename $0)" \
  "This script start the arma server" \
  "[arma3server_folder_path]" \
  $@

check_parameter $1

start_server $1

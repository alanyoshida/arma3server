#!/bin/bash

# Import functions
source functions.sh

# Show asciiart
logo

basic_help "$(basename $0)" \
  "This script executes a steam script." \
  "[steam_script_file]" \
  $@

check_parameter $1

h1 "Installing steam script $1"
steamcmd +runscript $1

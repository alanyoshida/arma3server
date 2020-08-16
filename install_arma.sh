#!/bin/bash
#set -o xtrace
source functions.sh

logo

h2 "Downloading steamcmd ..."
curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -

./steamcmd +runscript steam_scripts/steamcmd_install_arma_script

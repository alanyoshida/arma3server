#!/bin/bash

curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -

./steamcmd +runscript steamcmd_install_arma_script 

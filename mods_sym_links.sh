#!/bin/bash
# Import functions
source functions.sh

# Show asciiart
logo

basic_help "$(basename $0)" \
  "This script creates the symlinks for all the workshop mods in the arma server folder." \
  "[workshop_path] [arma_dedicated_server_path]" \
  $@

check_parameter $1
check_parameter $2

WORKSHOP_PATH=$1
ARMASERVER_PATH=$2
echo "Workshop path: $WORKSHOP_PATH"
echo "Arma dedicated server path: $ARMASERVER_PATH"

ask_continue

h1 "Show links that we will make"
ARMA_WORKSHOP_PATH="$WORKSHOP_PATH/content/107410/*"
ls $ARMA_WORKSHOP_PATH
for f in $ARMA_WORKSHOP_PATH; do
    if [ -d "$f" ]; then
        # $f is a directory
        $linkName=$(get_workshop_item_name $(basename $f))
        echo "ln -s $f $ARMASERVER_PATH/$linkName"
    fi
done
bold "Check if the links are correct, and continue."
ask_continue

h1 "Generating symlinks"
for f in $ARMA_WORKSHOP_PATH; do
    if [ -d "$f" ]; then
        # $f is a directory
        $linkName=$(get_workshop_item_name $(basename $f))
        echo "ln -s $f $ARMASERVER_PATH/$linkName"
        ask_continue
        ln -s $f $ARMASERVER_PATH/$linkName
    fi
done
#ln -s $WORKSHOP_PATH/content/107410/1376636636 /home/alanyoshida88/armaserver/ravage

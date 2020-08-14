#!/bin/bash

# logo - Show the with is in AsciiArt file
logo(){
  cat AsciiArt
}

#
# COLORS AND FORMATATION FUNCTIONS
#

h1(){
 echo -e "\e[1m
#
# $1
#
\e[0m"
}

h2(){
 echo -e "\e[1m
# $1
\e[0m"
}

red(){
 echo -e "\e[1m\e[31m$1\e[0m"
}

green(){
 echo -e "\e[1m\e[32m$1\e[0m"
}

yellow(){
 echo -e "\e[1m\e[33m$1\e[0m"
}

bold(){
 echo -e "\e[1m$1\e[0m"
}

error(){
 red "$1"
}

info(){
 yellow "$1"
}

sucess(){
 green "$1"
}

#
# GENERAL PURPOSE FUNCTIONS
#

# check_parameter - Check if the parameter is missing, and exit if missing
# $1 => Pass the parameter to be checked
check_parameter(){
  if [ -z "$1" ]; then
    error "[Error] Missing parameters \n"
    echo "Check usage in help options using --help or -h"
    exit 1
  fi
}

# out - Function to simplify the output format of bash, instead of use of \e[31m you can use <31>
# $1 => String containing the content to be printed
out()
{
    local params
    local message

    params="-e"
    while [[ ${1} = -* ]]; do
        params="${params} ${1}"
        shift
    done

    message="${@}<0>"

    message=$(echo "${message}" | sed -E $'s/<([0-9;]+)>/\033\[\\1m/g')
    echo ${params} "${message}"
}

# ask_continue - Function ask if you want to continue
ask_continue(){
  bold "\nDo you wish to continue ? (y/n):"
  read CONTINUE
  if [ "$CONTINUE" = "${CONTINUE#[Yy]}" ]; then
    exit 0
  fi
}

# basic_help - A basic help for the script, use -h or --help to show description and usage
# $1 => Script name
# $2 => Description
# $3 => Usage
# $4 => Pass all args, to work -h or --help
basic_help(){
  SCRIPT_NAME="$1"
  DESCRIPTION="$2"
  USAGE="$3"
  for args in $@
  do
    case $args in
      "-h" | "--help")
        show_basic_help "$SCRIPT_NAME" "$DESCRIPTION" "$USAGE"
        exit 0
        ;;
      *)
    esac
  done
}

# show_basic_help - Show a basic help for the script, use -h or --help to show description and usage
# $1 => Script name
# $2 => Description
# $3 => Usage
show_basic_help(){
  SCRIPT_NAME=$1
  DESCRIPTION=$2
  USAGE=$3
  out "
<1;4>Description<0>
  $DESCRIPTION

<1;4>Usage:<0>
  $SCRIPT_NAME [options] $USAGE

<1;4>Options:<0>
  -h, --help Show this help
"
}

# clean - Clean Up variable, removing spaces from beggining and end, and removing new line
# $1 => String to be cleaned
# Usage: variable=$(clean "$variable")
clean(){
  #local result=$(echo $1 | sed -e 's/^[[:space:]]*//')
  local result=$(echo "$1" | sed -e 's/^[[:space:]]*//' | sed -e 's/\n//g')
  echo "$result"
}

# get_workshop_item_name - Get the name from the steam workshop
# $1 => The id of the workshop item
# Usage: name=$(get_workshop_item_name "1234")
get_workshop_item_name(){
  local URL="https://steamcommunity.com/sharedfiles/filedetails/?id=$1"
  local workshopItem=$(curl -s $URL | grep "workshopItemTitle" | sed 's/<div class=\"workshopItemTitle\">//' | sed 's/<\/div>//')
  local title=$(clean "$workshopItem")
  #echo "Workshop item name is: >$title<"
  echo "$title"
}


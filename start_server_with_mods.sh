#!/bin/sh
set -o xtrace
#/home/alanyoshida88/armalegacy/arma3server -name=server -config=server.cfg -mod=

ARMA_SERVER_PATH="/home/alanyoshida88/armaserver"
echo "Run in background ? (y/n)"
read background
if [ "$background" != "${background#[yY]}" ] ;then
  nohup sh -c "$ARMA_SERVER_PATH/arma3server -name=server -config=server.cfg -mod=\"$1\"" &
  exit 0
fi
$ARMA_SERVER_PATH/arma3server -name=server -config=server.cfg -mod="$1" -netlog > log &

#!/bin/sh
set -o xtrace
#/home/alanyoshida88/armalegacy/arma3server -name=server -config=server.cfg -mod
basemods="cba_a3;cup_units;cup_weapons;cup_vehicles;enhanced_movement"
dayzmods="ravage;chernarus_redux;dayz_after_zero;warfarethai_armed_force;RHSAFRF;RHSUSAF"
./start_server_with_mods.sh "\"$dayzmods;$basemods\""

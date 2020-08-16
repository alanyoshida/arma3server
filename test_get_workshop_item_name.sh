#!/bin/bash

source functions.sh

h1 "Running get_workshop_item_name tests:"

test1=$(get_workshop_item_name 2194034630)
test1_expected="SPCO06FierceTide"
execute_test $test1 $test1_expected

test2=$(get_workshop_item_name 700125401)
test2_expected="SPDayzChernarus"
execute_test $test2 $test2_expected

test3=$(get_workshop_item_name 2193296534)
test3_expected="Eden20"
execute_test $test3 $test3_expected

test4=$(get_workshop_item_name 2191542091)
test4_expected="WIPAntiBounceSystemABS"
execute_test $test4 $test4_expected

test5=$(get_workshop_item_name 2195131993)
test5_expected="VindictaAltis90s"
execute_test $test5 $test5_expected

h2 "Tests completed"

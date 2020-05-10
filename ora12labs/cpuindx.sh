#!/bin/bash

users=8
bogo=`sed -n '/bogo/{ s/^bogo.* \([0-9]*\)\.[0-9]*$/\1/p}' /proc/cpuinfo`
echo $bogo
base=3342
cpuindex=`echo "scale=0; $users*$bogo/$base" | bc`
echo $cpuindex

echo $users

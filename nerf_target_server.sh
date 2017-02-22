#!/bin/env sh

if [ $# -eq 0 ] ; then
  echo "Usage: nerf_target_server.sh [ip address]"
  exit 1
fi

while true
do
nc -i3 $1 8090 < /dev/ttyACM0
sleep 1
done

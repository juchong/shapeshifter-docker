#!/bin/sh

###############################################################################################
# File Name: run.sh
# Description: Main execution script for running shapeshifter-dispatcher in a Docker container
# Args:
# Author: Juan Chong
# Email: juanjchong@gmail.com
###############################################################################################

sleep 1
exec /go/bin/shapeshifter-dispatcher \
    $ARGS

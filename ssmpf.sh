#!/bin/bash

# This is a script to use with SSM Portforwarded session
# it region instance_id and port
while getopts i:r:l: flag
do
    case "${flag}" in
        i) ssmpf_instance_id=${OPTARG};;
        r) ssmpf_remote_port=${OPTARG};;
		l) ssmpf_local_port=${OPTARG};;
    esac
done
{ # try
    aws ssm start-session --target $ssmpf_instance_id --document-name AWS-StartPortForwardingSession --parameters "localPortNumber=${ssmpf_local_port},portNumber=${ssmpf_remote_port}"
} || { # catch
    status=$?
    if [ $status -eq 253 ]; then
        echo "Try: \"aws configure set region <region>\""
    fi
}
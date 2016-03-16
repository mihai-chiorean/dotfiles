#!/bin/bash

if [ ! -f $HOME/Library/LaunchAgents ]; then
    mkdir -p $HOME/Library/LaunchAgents
fi

cp local.job.plist $HOME/Library/LaunchAgents

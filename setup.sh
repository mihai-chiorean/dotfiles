#!/bin/bash

if [ ! -f $HOME/Library/LaunchAgents ]; then
    mkdir -p $HOME/Library/LaunchAgents
fi


cp local.job.plist $HOME/Library/LaunchAgents

home="\"${HOME}\""
sed -i -- "s_\$HOME_${HOME}_g" $HOME/Library/LaunchAgents/local.job.plist
launchctl start "local.dotfiles"

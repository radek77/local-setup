#!/usr/bin/env bash

mv ./setup.sh ..
mv ./fix.sh ..

rm -rf ./init.sh
cd ..
rm -rf ./local-setup

echo -e "\n\nSetup completed: setup.sh and fix.sh files copied to main project folder.\n\n"

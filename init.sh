#!/usr/bin/env bash

mv ./setup.sh ..
mv ./fix.sh ..
mv ./release.sh ..

rm -rf ./init.sh
cd ..
rm -rf ./local-setup

echo -e "\n\nSetup completed: setup.sh, fix.sh and release.sh files copied to main project folder.\n\n"

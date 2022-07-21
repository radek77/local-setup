#!/usr/bin/env bash

npm run prod

projectFolder=${PWD##*/}
projectFolder=${projectFolder:-/}

projectFolder=${projectFolder//[\.]/-}

rm -rf ../"${projectFolder}".zip
zip -r9 ../"${projectFolder}".zip . -x node_modules\* -x vendor\* -x .git\* -x .idea\* -x .devcontainer\* -x .gitattributes -x release.sh -x .editorconfig -x .env -x .gitignore -x composer.lock -x docker-compose.yml

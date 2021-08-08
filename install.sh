#!/bin/sh

# get open discords
# tell to close others except one they want install/uninstall, pause
# bootstrap node.js

bootstrap () {
  binary="$(ps ax -o cmd | grep '/Discord[^-]*$')"
  ELECTRON_RUN_AS_NODE=1 $binary -e "require('http').get('https://raw.githubusercontent.com/Goose-Nest/GInEx1/main/install.js', (ret) => { ret.setEncoding('utf8'); let rawData = ''; ret.on('data', (chunk) => { rawData += chunk; }); ret.on('end', () => { eval(rawData); }); });"
}

binaries="$(ps ax -o cmd | grep '/Discord[^-]*$')"
# echo "$binaries"

if [[ $(echo "$binaries" | wc -l) -ge 2 ]]; then
  echo ">1 client open!
Please close other clients other than the one you want to install/uninstall GM."
  read -p "Press enter when ready"
fi

bootstrap
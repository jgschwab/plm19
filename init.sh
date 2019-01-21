#!/usr/bin/env bash

sudo chmod +x onea/onea
suod apt-get update
sudo apt-get install -y swi-prolog
cd onea/
./onea ; cd ../

#!/usr/bin/env bash

sudo chmod +x onea/onea
sudo apt-get update
sudo apt-get install -y swi-prolog
cd onea/
./onea ; cd ../

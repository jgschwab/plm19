#!/usr/bin/env bash

sudo chmod +x onea/onea
suod apt-get update
sudo apt-get install swi-prolog
cd onea/
./onea ; cd ../

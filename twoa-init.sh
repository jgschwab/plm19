#! /usr/bin/env bash

sudo chmod +x project2/*
sudo apt-get update
sudo apt-get install -y python3 python3-pip python3-setuptools
cd project2/duo/etc
./ide
make eg1
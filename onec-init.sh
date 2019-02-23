#! /usr/bin/env bash

sudo chmod +x onec/*
sudo apt-get update
sudo apt-get install -y clisp
cd onec/
clisp onec
cd ../

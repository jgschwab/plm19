#! /usr/bin/env bash

sudo chmod +x oned/*
sudo apt-get update
sudo apt-get install -y clisp
cd oned/
clisp oo1d.lisp
cd ../

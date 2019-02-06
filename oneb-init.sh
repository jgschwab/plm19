#! /usr/bin/env bash

sudo chmod +x oneb/*
sudo apt-get update
sudo apt-get install -y gnu-smalltalk
cd oneb/
echo "--------------Test Results-----------------"
gst my.st num.st testNum.st eject.st testEject.st b4now.st testB4Now.st myvisit.st testVisit.st

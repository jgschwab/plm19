#! /usr/bin/env bash

sudo chmod +x oneb/*
sudo apt-get update
sudo apt-get install -y gnu-smalltalk
cd oneb/
echo "--------------Test Output-----------------"
echo "------1b1------"
gst my.st num.st testNum.st
echo "------1b2------"
gst my.st eject.st testEject.st
echo "------1b3------"
gst my.st b4now.st testB4Now.st
echo "------1b4------"
gst my.st myvisit.st testVisit.st

#!/bin/bash

pushd .
cd /home/ales/cernivec-si
git pull
jekyl b
cp -r * /var/www/homepage-new/
chown www-data:www-data -R /var/www/homepage-new/*
popd 

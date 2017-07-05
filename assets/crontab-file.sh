#!/bin/bash

pushd .
cd /home/ales/cernivec-si
git pull
jekyll b
cp -r _site/* /var/www/homepage-new/
chown www-data:www-data -R /var/www/homepage-new/*
popd 

---
layout: post
title:  "The page is now secure and moved to the clouds"
date:   2018-08-05 22:00:10
categories: changes cloud security
---

Finally! I've come up with some spare time and moved the blog to HTTPS and to the cloud! Hopefully, this will make my life a bit easier (managing the server and posts).

What have I done? 

1. Spinned up a new VM (centos7).
2. Dockerized the blog based on Jekyll (dockerized as in use ```docker-compose``` and already premade ```jekyll``` docker image.
3. Hardened the VM (```firewalld```, set the rules, etc.)
4. Set-up Nginx and configure Let's Encrypt.
5. Added some cool colors to ```.bashrc``` to know on which server I reside after SSH-ing.
6. Oh, and ```sshd``` has also been a bit hardened. 

Hopefully, this will do for some time. There is still lots of things to do, like automatic backup to ```Koofr```, automatic (cronjob-based) Jekyll rebuilds, wire up additional domains via Let's Encrypt, do some monitoring of the site, etc.

Sources of this site are available [here][site].

All these will be described here soon.

Cheers!

[site]: https://github.com/alescernivec/cernivec-si

---
layout: post
title:  "Updating OwnCloud client - Ubuntu 16.04 LTS"
date:   2016-03-03 14:10:35
categories: updating owncloud client
---

Hawing problem updating OwnCloud client on Ubuntu 16.04 ? 

The issue is described and discussed [here][issue]. 

How to solve it?

```
$ wget http://download.opensuse.org/repositories/isv:ownCloud:desktop/Ubuntu_16.04/Release.key
$ sudo apt-key add - < Release.key && sudo rm Release.key
$ sudo apt-get update && sudo apt-get install owncloud-client
```

Voilà!

[issue]: https://github.com/owncloud/client/issues/5055

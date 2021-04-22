---
layout: post
title: Installing Java and Flash (Debian/Ubuntu)
category: computing
comments: false
---


Installation instructions for Sun's Java 6 and Adobe's Flash.
<!--more-->

## Java
For Debian prior to Wheezy, you will need to add the non-free repository to your <ic>/etc/apt/sources.list</ic>. Here is the corresponding line in mine :

``` bash
deb http://ftp2.fr.debian.org/debian/ squeeze main contrib non-free
deb-src http://ftp2.fr.debian.org/debian/ squeeze main contrib non-free
```

Then update your system and install java :

``` bash
$ apt-get update 
$ apt-get install sun-java6-jre sun-java6-plugin 
$ update-alternatives --config java 
```

_Note : sun-java6-plugin is a plugin for your browser._

For Ubuntu, use the following [script](https://github.com/flexiondotorg/oab-java6) for
creating a local apt repository.

For Debian Wheezy or others, you can no longer install Sun's Java from the repositories.
The easiest way is to download the JRE from [the official
site](http://www.oracle.com/technetwork/java/javase/downloads/index.html).

Extract it :

``` bash
$ mkdir /usr/local/java
$ tar xvzf jre-7u25-linux-i586.tar.gz -C /usr/local/java/
```

Create a symlink for Firefox :

``` bash
$ cd ~/.mozilla/plugins
$ ln -s /usr/local/java/jre1.7.0_25/lib/i386/libnpjp2.so
```

And, you're done !

## Flash

For Flash, you just need to grab the installation archive from the official
site. Then extract it to <ic>/usr/</ic>. Finally, copy <ic>libflashplayer.so</ic> in <ic>~/.mozilla/plugins</ic>. This should work for iceweasel/firefox.

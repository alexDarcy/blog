---
layout: post
title: Japanese configuration (Debian/FreeBSD)
category: computing
comments: false
---


This posts shows how to configure your Debian system for Japanese input and
output.
<!--more-->

## Debian
First, we will need some fonts. You can install :

``` bash
$ apt-get install otf-ipafont-mincho
```

_Note : I first installed ttf-kochi-gothic, then
ttf-takao-mincho. The takao mincho is more beautiful in my opinion but the
characters are rather small and difficult to read. For readability, I chose
otf-ipafont-mincho._

Now we will add Anthy for managing our Japanese input :

``` bash
$ apt-get install ibus ibus-anthy ibus-qt4 kasumi
```

Then we start the configuration : start <ic>im-config</ic> and choose <ic>ibus</ic> in the options. Logout, login and start ibus (either with the menu or with <ic>ibus-daemon</ic>).

If you cannot input circumlex accents after that, you will need to install
another package :

``` bash
$ apt-get install ibus-gtk
```

In the .bashrc file, you may have to add :

``` bash
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
```

## FreeBSD
The procedure is the same on FreeBSD. [Here is a link for the complete
configuration](http://grumplicio.us/fbsd_japanese.html).

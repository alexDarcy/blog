---
layout: post
title: Irssi configuration
category: computing
comments: false
---


Here are my scripts and configuration
<!--more-->

## Irssi and screen
With <ic>screen</ic>, we can create a terminal which can the be
detached and reattached at will. So I can connect to my computer over SSH and reattach
irssi : ta~da, I have my messaging client from the outside.  
We start a screen session named irssi with <ic>screen -S irssi</ic>. Then we launch irssi inside the new terminal. Now the session will be detached with <ic>Ctrl-A Ctrl-D</ic>.  It will be reattached by typing <ic>screen -raAd irssi</ic>.

## Irssi scripts
Installing a script is done by copying the script into <ic>.irssi/scripts</ic> 
and then loaded inside irssi with <ic>/script load
myscript.pl</ic>.  
If we want to start them automatically at boot, we create a symlink in the <ic>.irssi/scripts/autorun</ic> directory :

``` bash
$ ln -s myscript.pl autorun/
```

The scripts are available [here](http://scripts.irssi.org/). I use:

* bitlbee_join_notice.pl : tells you if a contact has reconnected in your chat
  windows.
* bitlbee_status_notice.pl : more information about the change of status (how
  long he has been away etc.). Get it
  [here](http://github.com/msparks/irssiscripts/raw/master/bitlbee_status_notice.pl).
* nickcolor.pl : assing a color for each user in an IRC chat (useful for large
  rooms).
* screen_away.pl : when my screen session is detached, I am marked as away and
  all the messages sent to me will be stored until I reattach the session.

## Troubleshooting
If trying to load a script results in <ic>Can't locate Time/Duration.pm</ic>, 
then you should install the time-duration library.
In Debian : 
``` bash
$ apt-get install libtime-duration-parse-perl
```


---
layout: post
title: Music (mpd, ncmpcpp)
category: computing
comments: false
---


Nothing like some music for making your computer more agreable. If you want lightweight and fast
softwares for listening to your musical library, do it inside a terminal ! 
<!--more-->
We will need mpd, an application for managing your collection, and another 
one which will serve as an interface, like ncmpcpp. 
[Here are some screenshots of a
session](http://ncmpcpp.rybczak.net/screenshots.php).

## Mpd
All of mpd files will be placed in <ic>/home/user/.mpd</ic>, so create a directory :

``` bash
$ mkdir /home/user/.mpd 
```

We will configure it as the "mpd" user. It is possible to start it as an user, but requires to start it yourself. With this configuration, it will launch automatically.
Once mpd is installed, you will need to create a configuration file. There
should be a file <ic>/etc/mpd.conf</ic>. Otherwise, copy the one given by the documentation, like <ic>/usr/share/mpd/mpd.conf.example</ic>. As a root, edit this file there and change only the music directory :

``` bash
music_directory       "/home/user/music"
```

The other parameters should be left at their defaut value :

``` bash
db_file               "/var/lib/mpd/mpd.db"
log_file              "/var/log/mpd/mpd.log"
pid_file              "/var/run/mpd/mpd.pid"
state_file            "/var/lib/mpd/mpdstate"
user                  "mpd"
```

Then we need to create the directories  :

``` bash
$ mkdir -p /var/lib/mpd/playlists /var/run/mpd 
```

Do not forget to create the files :

``` bash
$ touch /var/lib/mpd/mpd.db /var/log/mpd/mpd.log 
$ touch /var/run/mpd/mpd.pid /var/lib/mpd/mpdstate
```
    
Allow mpd write permissions

``` bash
$ chown -R mpd /var/lib/mpd /var/run/mpd
```

Mpd will then run in the background creating you database. It can take some time if you have a huge collection. 

## Ncmpcpp
Easy to configure : create a directory  "/home/user/.ncmpcpp". Inside, create a file named "config". Put the following :

``` bash
mpd_music_dir = "/home/user/music" 
```

where <ic>/home/user/music</ic> is the location of you music.

And... you are done ! Some basics commands:

* switch between the playlist and the browser view with <ic>Tab</ic>
* add a folder or a music to the current playlist with <ic>Space</ic>
* play the selected track immediately with <ic>Enter</ic>  

More help is avalaible with <ic>1</ic>. You can also edit the tags, sort the tracks and so on.

A cool feature is the ability to remote-control your music. For example, you can SSH to your computer and 
manage the music from a laptop. You just need a SSH server on the main computer. Even better, you can 
redirect mpd. I did not try it but instructions are available on [mpd's wiki](http://mpd.wikia.com/wiki/Music_Player_Daemon_Security).

Now is the time to listen to some good music...

## Troubleshooting
*Connection refused*  
If you have this message when starting MPD, it can be corrected with changing
the value of <ic> bind_to_address</ic> to 

``` bash
bind_to_address         "localhost"
```

*Flash incompatibily*  
If you are having problems with Flash compatibility, i.e you cannot play a music using mpd and watching a video for instance, try changing the following in <ic>/etc/mpd.conf</ic> :
 
``` bash
audio_output {
    type            "alsa"
    name           "My ALSA Device"
    options         "dev=dmixer"
    device          "plug:dmix"
}
```

It should solve any issues which appears in the log like this :

``` bash
Error opening alsa device "hw:0,0": Device or resource busy
```

If you still cannot start mpd, try commenting the bind_to_adress :

``` text
#bind_to_address		"localhost"
```


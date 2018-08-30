---
layout: post
title: Sound on Debian Wheezy
category: computing
comments: false
---


Just a quick post about my setup.
<!--more-->

Prior to Wheezy, I had to install the latest alsa from the website. Lo and
behold, sound was working directly with the new release, Wheezy. Unfortunately,
mpd was no longer working. The log said something like :

``` bash
can't find alsa mixer control "PCM"
```

Looking into the system logs showed up weird messages like :

``` bash
Unable to contact D-Bus: org.freedesktop.DBus.Error.NotSupported:
Unable to autolaunch a dbus-daemon without a $DISPLAY for X11
```

It turns out [these error messages are
normal](http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=690530). So I figured
pulseaudio was causing these problems. But removing it would mean removing gnome
(as a dependency). It is still possible as <ic>gnome</ic> and <ic>gnome-core</ic>
are metapackages.

The final step is to manage the system bell, which was still beeping. Pulseaudio
was the only way to manage sound from the desktop preference. 

The solution ? Disable the bell in your terminal.

And there, you're set !

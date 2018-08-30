---
layout: post
title: FreeBSD tips
category: computing
comments: false
---


Some tips I collected about FreeBSD.

*Update from 2012-11-01 (FreeBSD 11.1-RELEASE)*

<!--more-->

## Mount LVM Linux volumes from FreeBSD
You can have read and write access to LVM volumes, even though FreeBSD itself
cannot use LVM :

``` bash
kldload fuse
kldload /boot/kernel/geom_linux_lvm.ko # This will make /dev/linux_vm appear
fuse-ext2 -o rw+ /dev/linux_lvm/VolGroup00-lvhome /Linux
```

where <ic>VolGroup00</ic> is my physical volume, <ic>lvhome</ic> is my logical volume and <ic>/Linux</ic>
the mountpoint.
-o rw+ is used for read and write access.

I have also posted this information on the [FreeBSD
forums](https://forums.freebsd.org/threads/howto-mounting-ext4-in-lvm2.29659/#post-386112).

## Fix ugly fonts in Firefox
I followed the instructions on [this reddit
thread](https://www.reddit.com/r/freebsd/comments/7kqr5l/improving_firefox_fonts/).
What worked for me was to disable bitmap fonts 

``` bash
ln -s /usr/local/etc/fonts/conf.avail/70-no-bitmaps.conf
/usr/local/etc/fonts/conf.d/
```

## Redshift and Nvidia driver
Redshift must be started with the latitude and longitude (get it from Google
Maps from example) :

``` bash
redshift -l 44.148053:16.192406
```

If you have a `Failed to start adjustment method randr`, it may be because you are
note using the Nvidia driver. Install the latest driver 

``` bash
pkg install nvidia-driver
```

And create a configuration file for Xorg by following [this
thread](https://forums.freebsd.org/threads/howto-setup-xorg-with-nvidias-driver.52311/). Restart X and check with <ic>nvidia-settings</ic> than you are running the Nvidia driver.

## Uninstalling a program
You can go into the ports, and uninstall it manually :

``` bash
$ cd /usr/ports/myapp && make deinstall
```
or
``` bash
$ pkg delet myapp
```
## Extract useful information from /usr/ports/UPDATING
You can use <ic>pkg updating</ic> as [described
here](http://forums.freebsd.org/showthread.php?t=21142).

## Running Linux in Virtualbox from FreeBSD
First, you will need to install Virtualbox on FreeBSD and start it with <ic>Virtualbox</ic>. Then you have to install addition on the guest OS. Look in
the Virtualbox menu, at _Install additions_. Now run:

``` bash
$ sh ./runVirtualBoxLinux
```

If you have shared folders, <ic>mount -t vboxfs</ic> does not work.
So you must mount them with (on Linux) :

``` bash
$ mount.vboxfs sharedfolder folderlocation
```

Your folder will be available at <ic>folderlocation</ic>.

## Command-line tips (not FreeBSD specific)
### Screenshot
A screenshot can be taken with the <ic>scrot</ic> functionnality with a delay, for example
5 seconds :

``` bash
$ scrot -d 5
```

### Search files
A very useful utility for finding quickly a file is <ic>locate</ic>. You will
need to keep its database though. For that, see [the following
link](http://forums.freebsd.org/showthread.php?t=16100).

### FTP upload
Uploading files over FTP on the command-line can be done with 
``` bash
ncftpput -u LOGIN -p PASSWD IP remote_dir local_file
```

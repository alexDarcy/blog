---
layout: post
title: Reinstalling Grub from an USB
category: computing
comments: false
---


Here is how to reinstall your Grub if it has been wiped out by a Windows install for example. This will deal with a small Debian Live USB. 

<!--more-->
The easiest solution would be to create an Ubuntu Live USB and to follow [these
instructions](https://help.ubuntu.com/community/RecoveringUbuntuAfterInstallingWindows).
For small USB keys, it's best to use a Debian netinstall, which weighs around
10M.

## Create live usb
First, we need to ensure the usb has a partition with the correct format. As a superutilisateur run:

``` bash
$ fdisk /dev/sdc
```

whire <ic>/dev/sdc</ic> is your USB partition (the whole device, so not <ic>/dev/sdc1</ic> which is a partition). Then create a FAT32 partition: 

``` bash
n
p
1
[Enter]
[Enter]
```

Make it FAT32:

``` bash
t
b
```

Make it bootable and write the change to disks

``` bash
a
w
```

Finally, format it, just to be sure :

``` bash
$ mkfs.vfat /dev/sdc1
```

Now we need to copy an image on it. The first solution is to use a program called [unetbootin](http://unetbootin.sourceforge.net/) and follow the instructions.

If it does not work, get the .iso and write it on the device (not the partition):

``` bash
$ dd if=my.iso of=/dev/sdc
```

## Reinstall grub
Now boot from the USB, start install and go to partitoning step.
Then go the the shell with <ic>Alt-F2</ic>.
Mount the partition containing your root folder, along with <ic>/dev</ic> :

``` bash
$ mkdir /target
$ mount /dev/sdb1 /target
$ mount --bind /dev /target/dev
```

Chroot into it and reinstall grub (to the correct device, which should be (hd0) but do not take my word for it):

``` bash
$ chroot /target
$ grub-install '(hd0)'
```

And there you are, just reboot and everything is back to normal.

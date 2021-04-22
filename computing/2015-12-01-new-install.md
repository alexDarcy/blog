---
title: Configuring a new install
---
Here is my configuration on a fresh install (on Archlinux but it should work on
other Linux too). The idea is to do everything inside a terminal.
<!--more-->


## Mandatory

* Install xmonad
* Configure the bepo layout for french by adding the following in `.xinitrc` :
``` bash
setxkbmap fr bepo
setxkbmap -option "ctrl:swapcaps"
exec xmonad
```

## Useful programs
* stow : share easily your dotfiles across machines
* keychain : avoid to type your passphrase for every ssh connection. See 
[this post](2013-11-17-ssh-keys.html).
* zsh
* feh : for a background picture
* tmux : manage multiple terminal sessions
* rtorrent : manage your torrents

## Music 
Install the following (see [this post](2011-08-15-mpd-ncmcpp.html)).

* mpd
* ncmpcpp

## Mail
Install as shown in [this post](2011-07-23-mutt-fetchmail-procmail-msmtp.html).  
_Warning_ : we use offlineimap so there is no need to use fetchmail anymore as
in the initial post.

* mutt
* prochmail
* msmtp
* offlineimap (hard-coded passwords)

To configure offlineimap, see [http://dev.gentoo.org/~tomka/mail.html]().

Passwords are stored in `.netrc`, see [https://wiki.archlinux.org/index.php/OfflineIMAP#.netrc]().

To encrypt your mails with mutt, locate and copy `gpg.rc` in your `.muttrc`.

## Backup
### ZFS
First, we configure ZFS to scrub every 2 weeks. We use `/etc/anacrontab` as we reboot often :
``` bash
    14      0       zpool-scrub             /usr/bin/zpool scrub Data &> /root/scrub.log
```
Then we setup backup. the backup itself by creating a `/root/backup.sh` :
``` bash
    rdiff-backup --exclude **.git --include-globbing-filelist files_to_backup.txt \    
      --exclude /home/alex /home/alex /Data/Backup/home_backup  
    rdiff-backup --remove-older-than 2W /Data/Backup/home_backup
```
where the files must have an absolute path
Then update anacrontab :
``` bash
    3      15       backup                  /root/backup.sh &> /root/backup.log
```

### Cloud
To backup on Hubic, install the command-line utility with 
``` bash
pacman -S hubic
```
For Google drive, see [https://github.com/odeke-em/drive#initializing]().


## Terminal configuration
Solarized is a nice scheme. I use it with 

- mutt : ensure it is compiled with ncurses (check with `mutt -v`) :
``` bash
  export TERM=xterm-256color
```
- tmux
- xressources

## Japanese (archlinux)
- ibus, ibus-anthy, ibus-qt (the latter is needed for xmonad)
- adobe-source-han-sans-jp-fonts
- ibus-setup and add japanese input
- Add to .xinitrc :
``` bash
export GTK_IM, QT_IM, XMODIFIERS
 ibus-daemon --xim &
```
- Update .Xressource if you have a given font
``` bash
xterm*faceNameDoublesize: Source Han Sans JP:style=Regular:size=11
```

## Archlinux issues

## # No sound on Skype
First, enable multilib. Then install skype. Then install pulseaudio and pulseaudio-alsa. There is no need to change mpd configuration by the way.

### Juniper with 64bit archlinux
See [https://wiki.archlinux.org/index.php/Juniper_VPN#Alternative_Method]().
the idea is to installer 32bit java by hand on top on a 64bit (also by hand).



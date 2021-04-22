---
layout: post
title: Backup with rdiff-backup
category: computing
comments: false
---

Let's see how to do incremental automated backup for your files on Debian.
<!--more-->

First, we will define a list of folders to backup and place it into a file, for
example <ic>/root/folders.txt</ic>. In this example, we backup some folders
from <ic>/home</ic> :

``` bash
/home/john/movies
/home/john/perso
/home/john/pictures
```

After installing rdiff-backup, we can backup these folders into /Data/Backup
with:

``` bash
rdiff-backup  --include-globbing-filelist /root/folders.txt --exclude '**' /home/john /Data/Backup
```

The log will be available in <ic>/Data/Backup/rdiff-backup-data</ic>.

## Automated backup
Our strategy is to backup once a week and remove backup older than a month. For
that, let us create the complete backup script, for example in <ic>/root/backup.sh</ic>:

``` bash
#!/bin/sh
rdiff-backup  --include-globbing-filelist /root/folders.txt --exclude '**' /home/john /Data/Backup
rdiff-backup --remove-older-than 1M /Data/Backup/home_backup
```

Finally, we will use <ic>anacron</ic> to run the script once a week. Contrary
to crontab, it allows us to avoid running the computer 24hours a day and will
run the backup the next time the computer will boot if needed.


---
layout: post
title: Splitting files (from Linux to Windows)
category: computing
comments: false
---


Here is a simple tip for splitting a large file into small chunks on Linux and
reassemble it on Windows. No need to install anything !
<!--more-->

On Linux, split <ic>largefile</ic> into small files of 2040M named small00, small01... :

``` bash
$ split -b 2048m -d largefile small
```

On Windows, Assembling the files is simply done inside the DOS terminal with :

``` bash
$ copy /b small00 + small01 final
```

Don't forget to use the binary mode with <ic>/b</ic>, otherwise it will not work.

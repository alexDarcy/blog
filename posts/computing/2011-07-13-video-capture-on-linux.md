---
layout: post
title: Video capture on Linux
category: computing
comments: false
---


I have been struggling for a few days trying to make a video (for my water simulation). Meaning, I had to find something for recording my desktop. However, being on Linux and all, you sometimes have to search quite a bit for finding exactly what you want. So I have tested the following utilities.
<!--more-->

## Recordmydesktop
This is an easy-to-use command line utility. Just type 

``` bash
$ recordydesktop
```

and the capture starts.You can stop it with <ic>Ctrl-C</ic>. Easy, right ? Of course, there are also several interesting options like 

``` bash
$ recordmydesktop ---no-cursor ---no-sound
```

which will make sure you have neither the cursor nor the sound in the capture. I sometimes experienced intermittent lags, which broke the overall fluidity. By default, the output format is OGG, one of the few free formats. The main drawback here is the resolution of the output :I could not set it at the highest level. But if you do not want to make HD videos, this should suit you well enough.

##Ffmpeg
I chose this one for my captures. Albeit not perfect, it offers you the possibility of using several cores, leading to an improvement in performances. The output can however set to very good quality. For stopping the capture, juste type <ic>q</ic>. For example, you can use it like that (refer to the man page for more details !) :

``` bash
$ ffmpeg -f x11grab -s 1280x800 -r 25 -i :0.0+nomouse -s hd720 -vcodec libx264 -vpre lossless_ultrafast -an -threads 0 yourvideo.mkv </pre>
```

Now, what are all these options ?

 * removes the mouse cursor from the capture: <ic> -i :0.0+nomouse </ic>
 * enables multi-threading (if possible): <ic> -threads 0</ic>
 * captures the screen: <ic>-f x11grab </ic>
 * defines the size of the capture windows (here it is my entire screen): <ic> -s 1280x800 </ic>
 * sets the number of frames per seconds: <ic> -r 25</ic>
 * sets the resolution: <ic> -s hd720 </ic>
 * no audio will be captured: <ic> -an </ic>
 * using the H.264 encoding: <ic> -vcodec libx264 </ic>
 * these are settings for a fast encoding: <ic> -vpre lossless_ultrafast </ic>

 You are all set for some capturing now !

---
layout: post
title: Managing your music library tags with Perl
category: computing
comments: false
---


I wanted to get into Perl, and this is an excellent occasion for that.
We want to modify the tags of all our mp3 files. Tedious to do by hand, so we
need some script-fu.
<!--more-->

Here is what I came up with (my first perl script so it can surely be improved)
:

``` perl
    use strict;
    use File::Find;
    use File::Basename;
    
    my $base_path = '/MyMusic/Thelonious_Monk';
    find(\&wanted, $base_path);
    
    sub wanted {
      chomp $_;
      my @exts = qw(.mp3 .txt);
      my ($name, $path, $ext) = fileparse($_, @exts);
    
      if ($ext eq ".mp3") {
       system("id3v2","-a Thelonious Monk",$File::Find::name);
      }
    }
```


## What does it do ?
We first find all the files in the <ic>$base_path</ic> folder with the find utility. Then
we use <ic>fileparse</ic> to get the extension and the basename. 
If it is an MP3 file, then we will change the ID3 tag.
For that, we use a command-line utility called <ic>id3v2</ic>. With that, we can simply
change the composer of a music with :

``` bash
$ id3v2 -a Debussy Cathedrale_engloutie.mp3
```

So we only need to run this command in the shell script and voil&agrave;!
Of course, you can use the filename to update the title tag for example.

## Remarks
* A variable begins with a dollar sign, an array with a @.
* The <ic>$_</ic> is the current variable in the function.
* The function <ic>chomp</ic> remove the ending trail.
* At the end, <ic>wanted</ic> defines a function.
* The strict module is for debugging

## Edit
I have created 3 scripts to manage huge library of <ic>.flac</ic> files, which [can be found on
Github](https://github.com/alexDarcy/scripts) in the _Splitting music files_
section.

* First, split all the <ic>.flac</ic> files with <ic>split_all.pl</ic> (edit the
proper variable to define the location of the folder)
* Then, run <ic>check_split.pl</ic> to check the splitting was done properly.
* Finallly, <ic>finalize.pl</ic> removes the temporary folders and place the files in
their proper location.

Please note I hacked together these scripts so you may have to do some editing
(for example, you can modify them to adapt to <ic>.ape</ic> files).


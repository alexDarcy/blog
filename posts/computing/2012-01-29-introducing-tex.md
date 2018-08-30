---
layout: post
title: Introducing TeX
category: computing
comments: false
---


I have been using LaTeX for some time, and after beginning to read Knuth's TeXbook,
I wanted to try using TeX.
This post is merely an introduction for both but it will contains useful links for beginners.
<!--more-->

## What is LaTex ? What is it for ?
TeX and LaTeX are strongly related and both serves the same purpose. It allows you to typeset beautiful scientific documents. However, its use has spread far beyond the scientific community and can be used for publishing books for example.
When Donald Knuth (the creator of TeX) was writing his book, he became annoyed at the typesetting systems of the publishers and decided to create his own. Thus, TeX is born. Its success lead to the apparition of LaTeX by Leslie Lamport.

## What is LaTeX now ? 
Actually, it is a language. You type some code, compile it and lo! a pdf is generated. TeX is done in such a manner as to allow you to concentrate on the content. Well, in theory.
 <a href="http://people.umass.edu/phil335-klement-2/tlp/tlp.pdf"> Here </a> is an exemple of a document generated with LaTeX.

## What is the difference between LaTeX and TeX ?
The goal of LaTeX is to make TeX simpler. All the formatting is already done, so you just have to call the correct function. On the contrary, most of the things are to be done by hand in TeX. LaTeX is recommended for a beginner. You will be quite busy with it ! 

## Enough with the questions ! I want to start writing my own documents !
I will not go into the installation in details as it can be quite long.
For Linux, install texlive. It comes in different sizes (depending on the number of packages in it).
For Debian, a good start is <ic>texlive-latex-recommended</ic>.
On Windows, you can install MiKTeX. For the rest of this introduction, I will assume you are on Linux and have access to a terminal.
On Windows, just use TeXworks, the editor shipped with MiKTex and use it to compile.

Now, let's see how to write our first document in LaTeX. First, fire up you favorite editor and open a file named <ic>myfile.tex</ic>.
Write the following 

``` latex
\documentclass {article}
\begin{document}
This is a test.
\end{document}
```

That's all ! Then, compile it, and generate a pdf : 

``` bash
$ latex myfile.tex && dvipdf myfile.dvi
```

Quite simple actually ! We just said to LaTeX : "Open a document which looks like an article, and write some text".
It gets better : we will add a title, and a section. Here is the code :

``` latex
\documentclass{article}
\begin{document}
\title{My first article}"
\maketitle
This is an introduction.
\section{Let's talk about serious stuff}
Just kidding !
\end{document}
```

## Tell me more !
There are plenty of good tutorials on the Web (a sample is given below). If you want some final advice, read on.
First, a document has a preambule, which mostly set the style and import the good packages (languages for examples).
Then, you are not obliged to generate a pdf (which can be quite long if you have lots of pictures).
You may have see a dvi file is also created. You can open it with <ic>xdvi</ic> on Linux.
About pictures, see below for an (unfortunately) common error.
If you are stuck with LaTeX on an error like this one :

``` bash
    ! File ended while scanning use of \title."
    < inserted text > 
                    \par 
    <\*> lol.tex
    ? 
```

Just type <ic>x</ic> for cancelling the compilation or <ic>r</ic> for reloading  (after correcting the mistake of course !).

## Useful links
_LaTeX_

* [Wikibook](http://en.wikibooks.org/wiki/LaTeX): I always come back to it.  
* [The Not So Short Introduction](http://ftp.oleane.net/pub/CTAN/info/lshort/english/lshort.pdf)
* [LaTeX forums](http://tex.stackexchange.com/questions): for all these tricky
configurations.
* [List of symbols](http://amath.colorado.edu/documentation/LaTeX/Symbols.pdf):
good summary, everything you need should be here.

_TeX_ 

* [Good TeX introduction](http://www.ntg.nl/doc/wilkins/pllong.pdf): the best I have found.  
* Knuth's TeXBook: good reference but you need to read it completely to find
something.   
* [Another introduction](http://ctan.mines-albi.fr/info/gentle/gentle.pdf): as Knuth's TeXBook, you have to read it from the first to last page.  

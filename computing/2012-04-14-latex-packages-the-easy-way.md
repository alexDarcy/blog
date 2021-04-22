---
layout: post
title: LaTeX packages the easy way
category: computing
comments: false
---


One thing beginners struggle with LaTeX is the install of packages. For almost
everything you want to do there is a package for that. I will show you an easy
way to install them.
<!--more-->
Unless you have installed a complete distribution of LaTeX (for example, all the
TeXLive distribution, which is now the standard on Linux), you will have to
install a package at one time or another.

## What is a LaTeX package and how can we obtain them ?
If you are in a hurry, just get the adequate .sty file from the web and it
should get the job done.
Otherwise, you will find on the CTAN website a bundle containing a .tex 
file which you will have to "compile" into a .sty .

Then, several possibilities exist :

* Copy the .sty to your LaTeX directory 
* Copy the .sty to the folder containing your work 
* Use a custom folder given by LaTeX 

The first solution needs administrator rights and the second is only a temporary
workaround. We will use the last one.
If you want to install the package <ic>xfig</ic>, just create in your home
directory the following arborescence <ic>texmf/tex</ic> put your .sty inside an <ic>xfig</ic> folder
. There, you are done !

## I still want to install it for all users, how can I do ?
The procedure is the same, except you will put it inside the install directory
of TeXlive. It should be <ic>/usr/share/texmf/tex/latex/</ic>. Then update the
package list with the <ic>texhash</ic> command and you are done !

---
layout: post
title: LaTeX tricks
category: computing
comments: false
---


Here are some tricks I have found for LaTeX. This section will be updated from
time to time.
<!--more-->

## Changing fonts size

If you are using the article class for instance, three different font sizes are
available : 10,11,12 pt. You can use it like this :

``` latex
\documentclass[10pt]{article}
```

What if you want to use to other sizes ? Pre-built functions like <ic>\tiny</ic> do not
work on the section titles. The solution is to redefine <ic>fontsize</ic>:

``` latex
\documentclass{article}
\begin{document}
\tiny
\def\fontsize#1#2{} 
This is a test (hey,hey).
\section{One}
This is a test (hey,hey).
\end{document}
```

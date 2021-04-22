---
layout: post
title: Orthographic projection
category: projects
comments: false
---


Softwares for plotting a grid are usually very good for regular
latitude-longitude grids, like NCL or the Basemap package for Python. They can
also managed unstructured grids with interpolation. However, it is usually
impossible or very slow to draw an non-structured grid without interpolating
data.
<!--more-->

As I need that for my thesis, I wanted to see how hard it was to code an
orthographic projection. For that, I used the cairo library in C for speed. The
code could be cleaner (in C++ for example), but it works. Here is a small movie
showing we try any projection angles :

 <center>
<iframe width="560" height="315" src="http://www.youtube.com/embed/NKUdA_1P0dY" frameborder="0" allowfullscreen="allowfullscreen"> </iframe>
 </center>

The code is available at [Github](https://github.com/alexDarcy/projection).

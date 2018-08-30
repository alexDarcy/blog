---
layout: post
title: Shallow Water
category: projects
comments: false
---


Here is a video as an experiment for simulating shallow waters. Physically, it means the water height should
be much smaller than the dimensions of the water surface. It is also the case for tsunamis as their
wavelength is much longer than the water depth.  
Usually, their wavelength is several hundred of kilometers long !
 <!--more-->
 <center>
<iframe width="560" height="315" src="http://www.youtube.com/embed/CU0o72mZSM8" frameborder="0" allowfullscreen="allowfullscreen"> </iframe>
 </center>


In these situations, we can use the Shallow Water equations. For this simulation, I used the finite volume method for integrating the 2D version of the equations. The numerical scheme used was a Donor-Upwind scheme. The idea is to simplify the problem by solving only 1D-cases (much simpler), meaning we studied the problem in the x-direction first, then in the y-direction.

The code is available at [Github](https://github.com/alexDarcy/shallow-water).

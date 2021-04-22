---
layout: post
title: First attempt at Blender and Horde
category: projects
comments: false
---


For a future project, I have tried Blender and Horde in order to create a model,
animate it and place it into a 3D engine.
<!--more-->

## Blender
This tutorial on the wiki is very thorough for creating your first character.
Beware, it can take you some days. Here is what I have come up with in 2 days :

<center>
<a href="http://alexis.praga.free.fr/pictures/gollum.jpg">
<img width="400" height="300" src="http://alexis.praga.free.fr/pictures/gollum.jpg" alt="My precious" />
</a>
</center>

Of course, a human may not be the best way to start, but it's not bad for a
first attempt ! In order to animate that, you will need to create the mesh (a
looong) step, then create the skeleton. For each bone, you will have to define
the vertices it can move by weight painting. This allowed me to create the
previous "Gollum". Inside Blender, it looks like this :

<center>
<a href="http://alexis.praga.free.fr/pictures/gollum_blender.png">
<img width="400" height="225" src="http://alexis.praga.free.fr/pictures/gollum_blender.png" alt="My
precious (inside)" />
</a>
</center>

Now we need to animate on several frames in order to create a small movie. I
have animated the first step, then rendered the animation on the jpeg format. A
walk is finally created with ffmpeg. Note that you will need to create a picture
for each frame, so I symlink the new pictures to the old (see the script in the
github repo). Final result :

 <center>
<iframe width="560" height="315" src="http://www.youtube.com/embed/imxCzsFw6fc" frameborder="0" allowfullscreen="allowfullscreen"> </iframe>
 </center>

Not very realistic, but it was surprisingly fast (compared to the mesh
creation). Now, we only need a 3D engine !

## Horde3D
Before going to Horde3D, I have tried Ogre. It looked awesome but was
surprisingly difficult to install. On Debian, I managed to make it work only
with the source. Another issue, ATI graphics card (like the one I have) are not well-supported.

So I turned to Horde3D. Lightweight and with some examples, it may not do
everything you want, but it will do for me as a starting point.

To test that, I wanted to create a custom terrain. Horde3D
will create any terrain you want if you provide a heightmap. You can use
a grayscale image which will contain only the height and convert it with a
script (see the official wiki). Or you can create the heightmap with the normals
in the RGB format.
In the end, I have created mathematically a hill (as a product of cosines) and used
the python library PIL for reading/writing image files.

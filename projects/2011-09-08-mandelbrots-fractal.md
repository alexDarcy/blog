---
layout: post
title: Mandelbrot's Fractal
category: projects
comments: false
---

Let us embark in a journey inside the magical word of fractals. The most famous is the Mandelbrot fractal. Here is an applet for exploring it:
<!--more-->

_Controls :_

	*Left/right click for zoom in/out.
	*+/- for more/less iterations (improve accuracy)


<p class="center">
<applet code="Mandelbrot.class" name="Mandelbrot" archive="Mandelbrot.jar" codebase="/src/mandelbrot" width="300" height="300">
Your browser is not Java enabled.
</applet>
</p>

If it does not work, see the last section.

## What is it ?
The previous picture represents a set of points (a "fractal"), satisfying a certain mathematical condition. 
To each point c of the plane, we are going to apply the following function
several times : $$ f:x \to x^2+c$$.
So this means for a point of coordinate $c=(x,y)$, we will have the sequence 

$$ (c,c^2+c,(c^2+c)^2 +c,...)$$

Now c is in the Mandelbrot set if every term of the previous sequence is bounded. In practice, we can make the bound equal to 2.

How to display such a nice picture ?
With a computer program, we cannot go to infinity so we have to stop at a certain iteration, say 200. 
Then we can tell if every point of the screen is inside the set or not. The set should look like this :

<a class="center" href="/pictures/mandelbrot_bw.png">
<img class="overview" src="/pictures/mandelbrot_bw.png" alt="Black and white version"> </a>

So where did the colors come from ? In fact, they represent the number of iterations we had to do for each point.
If we had to go to the maximal number of iterations, the point will be set to black. Otherwise, we will attribute a color corresponding to the iteration (you can go wild on the choice of colors !). 
However, if you set a low maximal number of iterations, you will see several layers of colors. each corresponding 
to a number of iterations (left figure). 

Can we smooth the frontier between the layers ? The answer is yes, with the "Normalized Iteration Count" algorithm. Instead of associating a color directly to an iteration, we will add a term depending of the norm. 
If $z_k$ is the current point at iteration k, we will use $$k'$$ instead of k :

$$ k' = k - \frac{\frac{1}{2}\log|z_k|}{\log(2)}$$

With this, you should have something like the right figure :

<table class="image">
<td>
<a href="/pictures/mandelbrot_noalias.png">
<img class="overview" src="/pictures/mandelbrot_noalias.png" alt="Without aliasing"/>
</a>
</td>
<td>
<a href="/pictures/mandelbrot_alias.png">
<img class="overview" src="/pictures/mandelbrot_alias.png" alt="With aliasing"/>
</a>
</td>
<caption>Without aliasing (left) and with aliasing (right)</caption>
</table>

## What is so extraordinary about this fractal ?
Apart from its aestethic value, the Mandelbrot set has several interesting
properties.

One non-obvious result is that from any point inside the set, we can find a path
going to any other point : we say the set is connected. Mandelbrot first thought the
set was disconnected as the computer visualisation seems to reveal some
"islands" ! Actually, you can always find some filaments linking parts which
looked detachet from the main set.

Furthermore, the set contains replica of itself (it is self-similar). At the
left of the main cardiod (the bean-shaped curve), you can notice a circle. When
zooming at its left, you will see a pattern repeating (try it).

## Can I get the code ?
Sure. On Github, you can find a java version and a C++ version (needs the SDL
library).
[Here is the link](https://github.com/alexDarcy/Misc-math/tree/master/mandelbrot).

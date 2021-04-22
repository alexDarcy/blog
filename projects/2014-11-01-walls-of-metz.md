---
layout: post
title: Old walls of Metz
category: projects
comments: false
---

Mapping the position of the old walls of Metz (France) with QGIS.
<!--more-->

I wanted to test [QGIS]() to create a small map so I chose to use an old German
map of Metz and to superpose it to the current map. The idea was to show where
the old walls were before being destroyed.

## Getting the data
This was the most difficult part for me: importing enough data to have a proper
map of the town. I used two datasets. The first came from
[Geofabrik](http://download.geofabrik.de/europe/france/lorraine.html), which
provides roads, waterways and other things for the whole region (Lorraine). The
files used were:

* lorraine/landuse.shp
* lorraine/natural.shp
* lorraine/railways.shp
* lorraine/roads.shp
* lorraine/waterways.shp

I also used data from [Openstreetmap](https://www.openstreetmap.org) (which restricted the license by the
way) by zooming to Metz and exporting the data to QGIS.

## Result
Here is the final result, in png format:

<center>
<a href="http://alexis.praga.free.fr/pictures/walls_of_metz_large.png">
<img width="400" height="300"
src="http://alexis.praga.free.fr/pictures/walls_of_metz_small.png"
alt="Metz" />
</a>
</center>

## Source code
I posted on [Github](https://github.com/alexDarcy/walls-of-metz) the file needed
by QGIS, but not the data as it was too heavy.


---
layout: post
title: Importing Google Contacts to Gnus
category: projects
comments: false
---


As the recommandations of the EmacsWiki were not working, I hacked together a
script.
<!--more-->

I am currently trying Gnus instead of Mutt as an email client. While mutt uses a
simple text file for managing contact, it is cumbersome.
Gnus on the other hand offers a software called BBDB which comes with its own
format.
I tried the different solutions [on the
EmacsWiki](http://www.emacswiki.org/emacs/BbdbImporters) but there was always
something screwing things up.

So I wrote a very simple Perl script which convert the names and emails of your
Google contact to this format.
You can [get it on Github](https://github.com/alexDarcy/bbdb-import), with
instructions.

_Note_: I wrote that fairly quickly so it can obviously be improved but it
worked well. 
For example, the BBDB module of CPAN did not manage accents very well, so I
wrote the configuration file by hands.

---
layout: post
title: Static site generation with Jekyll
category: computing
comments: false
---


Do you search for a fast, portable way to create your site with a command-line
tool ?
It exists and is called Jekyll.
<!--more-->

## What is Jekyll ?
A static site generator. Basically, you just have to enter your blog posts in
small text files and it will generate a complete site out of it.
Static means it is pure HTML so the result will be light (no java) and safe (no
requests).
If you want to customize your site, I recommend it. For easier versions, see the
last section.

Another huge advantage (which decided me), is that you can use latex formulas.
It will create automatically pictures and inserts it where it should. Neat, huh
?

## A typical usage
This site is done with Jekyll. Whenever I post a new article, I just create a
text file with a small header indicating some informations. Take for example this
article:

``` bash
---
layout: post
comments: true
Static site generation with Jekyll
category: computing
---

Do you search for a fast, portable way to create your site with
a command-line tool ?  This exists and is called Jekyll.
```

Then the site is generated locally

``` bash
$ jekyll serve
```

Copy all the files on your server, and voilà !

## How do I install it ?
You have to install Rubygems, a package manager and use it for
installing Jekyll. On Debian :

``` bash
$ apt-get install gem
$ gem install jekyll
```

## I am ready, where do I start ?
_Note :_ you can use my blog as an example. See [the git
repository](git@github.com:alexDarcy/blog.git).

First, set a homepage named index.markdown. Specify the layout and the content
like this :

``` bash
---
layout: home
---

Hello and welcome !
```

This homepage will use the default home theme. A theme is simply a
html file placed in the <ic>_layout</ic> directory. For my blog,
the themes are actually defined in <ic>_include/themes/minimalist</ic> with several versions for each page. You can define several pages at the same level than the home page. In my case, I used one page for each category.

Then, you can add you posters in the <ic>_posts</ic> directory. 
There must be on the Markdown format and the filename must respect the
convention <ic>DATE-SMALLTITLE.markdown</ic>. Example :

``` bash
---
layout: post
comments: true
Static site generation with Jekyll
category: computing
---

Hi there.
```

Finally, we can generate our site with 

``` bash
$ jekyll serve
```

Open a browser and go to <ic>http://localhost:4000</ic> (the address given by
jekyll). Lo, and behold ! Your site is there.
The last step is to upload it to your site. I use <ic>ncftpput</ic> in an update script which puts every thing on the server. Note that you only need to send the <ic>_site</ic> folder, which will contain the site, plus
eventual folders, like png pictures generated for LaTeX formulaes.

## Customization
Jekyll configuration is done in the <ic>_config.yml</ic> file.
There, you can specify the interpreter. I set it to <ic>maruku</ic> initially,
but the new version uses <ic>kramdown</ic>.

If you want to add comments on your site, you can create a Disqus account. Then
you will need to add some code in your html header, but it is quite painless.

Of course, each category page list automatically the post of its category. This
is done by jekyll. See <ic>computing.markdown</ic> for an
example. Each category will only list the first line of the post. For that, each
post will have a <ic><!--more--></ic> macro.

Finally, you can see each post links to the previous and next post. This was
tricky and there is apparently no simple solution. The approach I have found
on the Web is in the theme <ic>post.html</ic> and need to
hardcode all the categories.

## Writing math
When I first wrote this post, I used <ic>blahtex</ic> to write formulae.
However, the new version is done using <ic>Mathjax</ic> and is easier to use. If
you still want the old instructions, see at the end. To use <ic>Mathjax</ic>, I
simply put the following in the HTML header:

``` html
<!-- Mathjax configuration -->
<script type="text/x-mathjax-config">
MathJax.Hub.Config({
  jax: ["input/TeX", "output/HTML-CSS"],
    tex2jax: {
      inlineMath: [ ['$', '$'] ],
      displayMath: [ ['$$', '$$']],
      processEscapes: true,
      skipTags: ['script', 'noscript', 'style', 'textarea', 'pre',
                  'code'] },
      messageStyle: "none",
       "HTML-CSS": { preferredFont: "TeX", availableFonts:
                          ["STIX","TeX"] } });
</script>
<script src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS_HTML" type="text/javascript"></script>
```

Then you can simply write equations in Markdown:

``` text
$$ f(x) = x^2$$
```

## Are there easier versions to use ?
[Octopress](http://octopress.org/) is a good way to have a nice and clean site
in minutes. There is also some customisations available. For a complete control
over your site, I prefer Jekyll. If you like the Octopress template, stop
searching and try it !

## Embedding Youtube videos does not work !
The parser has issues with reading the code. You just need to add a space before
the closing <ic> ispace</ic>.
Thank the [original author](http://redlegion.org/2012/03/31/Jekyll-and-youtube-embedding/) for this tip.

## What about Github pages ?
If you want free hosting with jekyll, you can use Github pages. You only have to
upload your posts and the website will be generated by Github. A small
documentation is available on the [official
site](https://help.github.com/articles/using-jekyll-with-pages). Beware, you
cannot use blahtex as mentionned before. An alternative is to use a site for
generating the pictures, like
[codedogs](http://www.codecogs.com/latex/htmlequations.php).

## Using blahtex (old version)
The idea is to generate png pictures for each formula in the markdown file. Do
not forget to upload the pictures to your site !

If you want to install blahtex from source. For that,
download the [source code](http://gva.noekeon.org/blahtexml/how_to_build.html)
Extract it and build it with <ic>make blahtex-linux</ic>. Don't forget to copy the
executable to <ic>/usr/local/bin</ic>.

If blahtex is not installed, you will have the following error :

``` bash
/var/lib/gems/1.8/gems/maruku-0.6.1/lib/maruku/ext/math/mathml_engines /blahtex.rb:40: in convert_to_png_blahtex:
Blahtex error: empty output (RuntimeError)
```

You can also install blahtexml instead with Debian packages : 

``` bash
$ apt-get install preview-latex
$ apt-get install dvipng
$ apt-get install blahtexml
$ apt-get install ln -s /usr/bin/blahtexml /usr/bin/blahtex
```

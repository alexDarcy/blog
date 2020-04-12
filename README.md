# Installation
Install `stack` then run

    stack setup
    stack build
    stack install

# Structure
Posts are either markdown or org files and generated to HTML with Hakyll.

Some files are meant to be compiled with latex so we use 
- emacs to convert from org to latex (pandoc does not work here)
- latexmk to convert from latex to pdf
I could not make it work with Hakyll)

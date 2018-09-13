Vortoj
======

Conlang Muse
------------

Vortoj is a conlang word generator as my project for the
"Special Topics in Information Technology" (ITEC 4400) course at
[Georgia Gwinnett College](http://www.ggc.edu).

Compiling
---------

``` lisp
(load #P"vortoj.asd")
(ql-quickload :vortoj)
(save-lisp-and-die #P"www/cgi-bin/vortoj.fcgi"
                   :toplevel #'vortoj:main
                   :executable t)
```

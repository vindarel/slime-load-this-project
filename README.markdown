SLIME utilities

status: bad quality. They probably exist somewhere else.


## M-x slime-load-this-project

Find the asd declaration at the project root, load the file and load
the system.

The system name is inferred from the file name. This can be improved.

This saves me some typing: opening the .asd file, typing C-c C-k, then quickload-ing the system.


Another solution is to clone all lisp projects into `~/common-lisp/` (or into `~/quicklisp/local-projects`, but I'd advise to let it for Quicklisp only, in case you need to debug stuff).

Another solution, but that requires one edit, is to populate
`asdf:*central-registry*` in one's .sbclrc / .ccl-init.lisp:

```lisp
(pushnew "~/path/to/myproject/" asdf:*central-registry* :test #'equal)
```

or to push all projects from a directory.

## M-x slime-describe-system-dependencies

From a system name (a string), show its dependencies along with their description.

XXX: probably something does this better already?

```
(slime-describe-system-dependencies "felonix")

Dependencies of felonix:

== ciel ==

CIEL Is an Extended Lisp.

== progressons ==

Display a progress bar on one line.

== termp ==

Check if we are in a dumb or real terminal. Provide the termp check and a quit function.

== cl-ftp ==

FTP library

== defclass-std ==

A shortcut macro to write DEFCLASS forms quickly.

== defmain ==

A wrapper around net.didierverna.clon which makes command line arguments parsing easier.

== cl-slug ==

Small library to make slugs, mainly for URIs, from english and beyond.
```

todo: an Emacs buffer.


## Licence

LGPLv3

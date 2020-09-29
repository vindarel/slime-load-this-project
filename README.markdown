Common Lisp utility

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


## Licence

LGPLv3

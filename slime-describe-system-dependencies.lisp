
(defun slime-describe-system-dependencies (system-name)
  "For SYSTEM-NAME (a string), list its dependencies along with their description."
  (let* ((system (ignore-errors (asdf:find-system system-name)))
         deps)
    (cond
      (system
       (setf deps (asdf:system-depends-on system))
       (format t "~%Dependencies of ~a:~&" system-name)
       (loop for dep in deps
          for dep-system = (asdf:find-system dep)
          for source-control = (ignore-errors (asdf:system-source-control dep-system))
          do (format t "~%== ~a ==~&~%~a~%" dep (asdf:system-description dep-system))
          when source-control
          do (format t "~%~S~%" source-control)))
      (t
       (format t "System not found: ~a" system-name)))))


(require 'projectile)
(require 'f)
(require 's)

(defun slime-load-this-project ()
  "Find the asd declaration at the project root,
  load the file and load the system.

  The system named is inferred from the file name. This can be improved."
  (interactive)
  (let ((asds (f-glob "*.asd" (projectile-project-root))))
    (when asds
      (when (yes-or-no-p (concat "Load file " (first asds) " and system XXX" "?"))
        (when (slime-load-file (first asds))
          (slime-load-system (first (s-split "\\." (f-filename (first asds))))))))))


(require 'projectile)
(require 'f)
(require 's)

(defun get-system-name (asds)
  "Return the system name to load."
  (first (s-split "\\." (f-filename (first asds)))))

(defun slime-load-this-project ()
  "Find the asd declaration at the project root,
  load the .asd and load the system.

  The system name is inferred from the file name. This can be improved."
  (interactive)
  (let* ((root (projectile-project-root))
         (asds (f-glob "*.asd" root))
         system)
    (cond
     ((null asds)
      (message "No .asd file found on %s" root))
     (t
      (setq system (get-system-name asds))
      (when (and asds
                 (yes-or-no-p (concat "Load file " (first asds) " and system " system "?")))
        (slime-load-file (first asds))
        (slime-load-system system))))))


(require 'projectile)
(require 'f)
(require 's)


(defun sort-asd-names-predicate (x y)
  (cond
   ((and (s-ends-with-p "test" x)
         (s-ends-with-p "test" y))
    (if (> (length x)
           (length y))
        nil
      t))
   ((s-ends-with-p "test" x)
    nil)
   (t
    t)))

(defun my-test ()
  (assert (equal (sort '("test-asd-test" "test-asd") 'sort-asd-names-predicate)
                 '("test-asd" "test-asd-test")))
  (assert (equal (sort '("asdtest-test" "asdtest") 'sort-asd-names-predicate)
           '("asdtest" "asdtest-test"))))

(defun get-asd-file (asds)
  "From these asd file names (strings), pick the one that is not a test definition."
  (first (sort asds 'sort-asd-names-predicate)))

(defun get-system-name (asd)
  "Return the system name to load from this asd file.
  It is guessed from the file name, it is not read from the file content. This can be improved."
  (first (s-split "\\." (f-filename asd))))

(defun slime-load-this-project ()
  "Find the asd declaration at the project root,
  load the .asd and load the system.

  The system name is inferred from the file name. This can be improved."
  (interactive)
  (let* ((root (projectile-project-root))
         (asds (f-glob "*.asd" root))
         asd
         system)
    (cond
     ((null asds)
      (message "No .asd file found on %s" root))
     (t
      (setq asd (get-asd-file asds))
      (setq system (get-system-name asd))                 ;; TODO: the system name inside the file can be different.
      (when (and asd
                 system
                 (yes-or-no-p (concat "Load file " asd " and system " system "?")))
        (slime-load-file asd)
        (slime-load-system system))))))

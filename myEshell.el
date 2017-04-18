(defun pcomplete/jp ()
  "Complete a command that wants a name of a file in ~/.marks."
   (pcomplete-here* (directory-files "~/.marks/")))

;; create a .marks directory in the home directory
;; then create a bunch of symbolic links point to the directory used often
;; then type <jp> <directory name> in the eshell will cd to that directory
(defun eshell/jp (mark)
  "Jump to a directory symlinked to by a file called ~/.marks/MARK."
   (eshell/cd (file-symlink-p (concat "~/.marks/" mark))))

(defun eshell/clear ()
  "Clear the eshell buffer."
  (let ((inhibit-read-only t))
    (erase-buffer)
    (eshell-send-input)))

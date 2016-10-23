(defcustom xah-shell-abbrev-alist nil "alist of xah's shell abbrevs")

(setq xah-shell-abbrev-alist
      '(

        ("gst" . "git status")
        ("gcmsg" . "git commit -m")
        ("gp" . "git push")

        ("rm empty" . "find . -type f -empty")
        ("findEmptyDir" . "find . -depth -empty -type d")
        ("rmEmptyDir" . "find . -depth -empty -type d -exec rmdir {} ';'")
        ))

(defun xah-shell-commands (φcmd-abbrev)
  "insert shell command from a list of abbrevs.

;;URL `http://ergoemacs.org/misc/emacs_abbrev_shell_elisp.html'
;;version 2015-02-05"
  (interactive
   (list
    (ido-completing-read "shell abbrevs:" (mapcar (lambda (x) (car x)) xah-shell-abbrev-alist) "PREDICATE" "REQUIRE-MATCH")))
  (progn
    (insert (cdr (assoc φcmd-abbrev xah-shell-abbrev-alist)))))

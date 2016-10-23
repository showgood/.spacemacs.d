(defun cygwin-shell ()
  "Run cygwin bash in shell mode."
  (interactive)
  "tab completion doesn't work in zsh"
  (let ((explicit-shell-file-name "C:/cygwin/bin/bash"))
    (call-interactively 'shell)))

(setq magit-git-executable "C:/Users/xiaomingw/AppData/Local/Programs/Git/cmd/git")
;; (load "~/dotspacemacs/gnus.office.el")

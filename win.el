(load (concat dotspacemacs-directory "common.el"))
(load (concat dotspacemacs-directory "eshell.win.el"))
(load (concat dotspacemacs-directory "tramp.win.el"))
(setq eshell-directory-name (concat dotspacemacs-directory "eshell_win"))
(setq magit-git-executable "c:/Program Files (x86)/GIT/cmd/git.exe")

;; (defun cygwin-shell ()
;;   "Run cygwin bash in shell mode."
;;   (interactive)
;;   "tab completion doesn't work in zsh"
;;   (let ((explicit-shell-file-name "C:/cygwin/bin/bash"))
;;     (call-interactively 'shell)))

;; (setenv "PATH" (concat (getenv "PATH") ";C:/Users/xwu157/Downloads/PortableGit/bin;C:/Cygwin/bin"))
;; (setq exec-path (append exec-path '("C:/Users/xwu157/Downloads/PortableGit/bin;C:/Cygwin/bin")))

(require 'tramp)
(set-default 'tramp-auto-save-directory "~/tmp")
(setq tramp-inline-compress-start-size 10000000)
(add-to-list 'tramp-remote-path 'tramp-own-remote-path)

(load (concat dotspacemacs-directory "common.el"))
(load (concat dotspacemacs-directory "toolkit-tramp.el"))

;; (load (concat dotspacemacs-directory "keys"))
(load (concat dotspacemacs-directory "bb.el"))
;; (load (concat dotspacemacs-directory "dired+.el"))
;; (load (concat dotspacemacs-directory "mydired.el"))
;; (load (concat dotspacemacs-directory "typeless.el"))
;; (load (concat dotspacemacs-directory "functions.el"))
;; (load (concat dotspacemacs-directory "myivy.el"))
(load (concat dotspacemacs-directory "mytramp.el"))
;; (load (concat dotspacemacs-directory "myFindFile.el"))
;; (load (concat dotspacemacs-directory "csv-mode.el"))

(setq eshell-directory-name (concat dotspacemacs-directory "eshell_linux"))

(org-babel-do-load-languages
 'org-babel-load-languages
 '( (perl . t)
    (ruby . t)
    (plantuml . t)
    (ditaa . t)
    (sh . t)
    (python . t)
    (dot . t)
    (C . t)
    (js . t)
    (emacs-lisp . t)
    ))

(setq org-plantuml-jar-path "~/soft/plantuml.8033.jar")


;; (setq magit-git-executable "c:/Program Files (x86)/Git/bin/git.exe")

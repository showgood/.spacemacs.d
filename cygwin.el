(require 'tramp)
(set-default 'tramp-auto-save-directory "~/tmp")
(setq tramp-inline-compress-start-size 10000000)
(add-to-list 'tramp-remote-path 'tramp-own-remote-path)

(load (concat dotspacemacs-directory "common.el"))
(load (concat dotspacemacs-directory "toolkit-tramp.el"))
(load (concat dotspacemacs-directory "bb.el"))
(load (concat dotspacemacs-directory "mytramp.el"))
(load (concat dotspacemacs-directory "myOrg.el"))

(setq eshell-directory-name (concat dotspacemacs-directory "eshell_cygwin"))

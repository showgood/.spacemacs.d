(load (concat dotspacemacs-directory "common.el"))
(load (concat dotspacemacs-directory "bb.el"))
(load (concat dotspacemacs-directory "comdb2-sql3.el"))
(setq eshell-directory-name (concat dotspacemacs-directory "eshell_linux"))

(setq x-select-enable-clipboard t)
;; Treat clipboard input as UTF-8 string first; compound text next, etc.
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

(require 'ansi-color)
(setq ansi-color-for-comint-mode t)
(setq term-buffer-maximum-size 0)

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
(setq org-startup-indented t)
(setq org-src-fontify-natively t)
(setq org-startup-with-inline-images t)

(load (concat dotspacemacs-directory "common.el"))
(setq eshell-directory-name (concat dotspacemacs-directory "eshell_linux"))

(setq x-select-enable-clipboard t)
;; Treat clipboard input as UTF-8 string first; compound text next, etc.
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

(require 'ansi-color)
(setq ansi-color-for-comint-mode t)
(setq term-buffer-maximum-size 0)

(setq org-plantuml-jar-path "~/soft/plantuml.8033.jar")
(setq org-startup-indented t)
(setq org-src-fontify-natively t)
(setq org-startup-with-inline-images t)

;; (load (concat dotspacemacs-directory "myPdf.el"))
;; (load (concat dotspacemacs-directory "myScheme.el"))
(autoload 'paperless "paperless" "A major mode for filing PDFs" t)
(add-to-list 'load-path "~/.spacemacs.d/external/paperless")
(setq paperless-capture-directory "/media/sf_showg/Documents/scan")
(setq paperless-root-directory "/media/sf_showg/Documents/docs")

(load (concat dotspacemacs-directory "sandbox.el"))

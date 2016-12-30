(load (concat dotspacemacs-directory "common.el"))
(setq eshell-directory-name (concat dotspacemacs-directory "eshell_linux"))

(setq x-select-enable-clipboard t)

;; Treat clipboard input as UTF-8 string first; compound text next, etc.
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

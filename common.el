;; stop spacemacs keep asking for installing a layer
;; when open a certain file type
(setq dotspacemacs-enable-lazy-installation nil)

(setq tab-width 4)
(semantic-mode 1) ;; -> this is optional for Lisp

(global-linum-mode t)
(global-company-mode t)

(add-to-list 'load-path (concat dotspacemacs-directory "external"))

(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)

(load (concat dotspacemacs-directory "external/" "runCurrentFile.el"))
(load (concat dotspacemacs-directory "shell_abbrev"))
(load (concat dotspacemacs-directory "alias"))
(load (concat dotspacemacs-directory "projectile.el"))
(load (concat dotspacemacs-directory "mydired.el"))
(load (concat dotspacemacs-directory "myivy.el"))
(load (concat dotspacemacs-directory "myediff.el"))
(load (concat dotspacemacs-directory "typeless.el"))
(load (concat dotspacemacs-directory "myCal"))
(load (concat dotspacemacs-directory "myvc.el"))
(load (concat dotspacemacs-directory "mycpp.el"))
(load (concat dotspacemacs-directory "myabbrev.el"))
(load (concat dotspacemacs-directory "keys"))
(load (concat dotspacemacs-directory "company.el"))
(load (concat dotspacemacs-directory "myFindFile.el"))
(load (concat dotspacemacs-directory "myShell.el"))
(load (concat dotspacemacs-directory "myEshell.el"))

;; put this at last
(load (concat dotspacemacs-directory "functions"))

;; disable company mode in shell
;; (add-hook 'shell-mode-hook (lambda () (company-mode -1)) 'append)

;; (load (concat dotspacemacs-directory "myOrg.el"))
;; (load (concat dotspacemacs-directory "visual-regexp/visual-regexp.el"))
;; (load (concat dotspacemacs-directory "visual-regexp-steroids/visual-regexp-steroids.el"))

;; (load (concat dotspacemacs-directory "keyfreq.el"))
;; (require 'keyfreq)
;; (keyfreq-mode 1)
;; (keyfreq-autosave-mode 1)

;; (add-to-list 'load-path "~/dotspacemacs/bookmark-plus/")
;; (require 'bookmark+)

;; Make script files executable automatically
;; https://www.masteringemacs.org/article/script-files-executable-automatically
(add-hook 'after-save-hook   'executable-make-buffer-file-executable-if-script-p)

;; for proced
(setq-default proced-auto-update-flag t)
(setq-default proced-auto-update-interval 5)
;; (add-hook 'proced-mode-hook 'eos/turn-on-hl-line)

;; It’s much easier to move around lines based on how they are
;; displayed, rather than the actual line. This helps a ton with
;; long log file lines that may be wrapped:
(setq line-move-visual t)

;; Save whatever’s in the current (system) clipboard before replacing it with the Emacs’ text.
(setq save-interprogram-paste-before-kill t)

;; (require 'golden-ratio)
;; (golden-ratio-mode 1)
;; (setq golden-ratio-auto-scale t)

;; use web-mode instead of nxml for xml
(add-to-list 'auto-mode-alist '("\\.xml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.xsd\\'" . web-mode))

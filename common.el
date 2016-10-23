(global-linum-mode t)
(global-company-mode t)

(load (concat dotspacemacs-directory "runCurrentFile.el"))
(load (concat dotspacemacs-directory "shell_abbrev"))
(load (concat dotspacemacs-directory "alias"))
(load (concat dotspacemacs-directory "functions"))
(load (concat dotspacemacs-directory "projectile.el"))

(load (concat dotspacemacs-directory "myOrg.el"))
(load (concat dotspacemacs-directory "keys"))
(load (concat dotspacemacs-directory "myCal"))
(load (concat dotspacemacs-directory "dired+.el"))
(load (concat dotspacemacs-directory "cpp.el"))

;; (load (concat dotspacemacs-directory "visual-regexp/visual-regexp.el"))
;; (load (concat dotspacemacs-directory "visual-regexp-steroids/visual-regexp-steroids.el"))
;; (load (concat dotspacemacs-directory "myhydra.el"))
;; (load (concat dotspacemacs-directory "abbrev"))
;; (load (concat dotspacemacs-directory "company.el"))
;; (load (concat dotspacemacs-directory "typeless.el"))

(setq diredp-hide-details-initially-flag nil)

;; (load (concat dotspacemacs-directory "keyfreq.el"))
;; (require 'keyfreq)
;; (keyfreq-mode 1)
;; (keyfreq-autosave-mode 1)

;; (add-to-list 'load-path "~/dotspacemacs/bookmark-plus/")
;; (require 'bookmark+)

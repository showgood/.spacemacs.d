;; stop spacemacs keep asking for installing a layer
;; when open a certain file type
(setq dotspacemacs-enable-lazy-installation nil)

(setq tab-width 4)
;; (semantic-mode 1) ;; -> this is optional for Lisp

(global-linum-mode t)
(global-company-mode t)

(add-to-list 'load-path (concat dotspacemacs-directory "external"))

(if (not (eq system-type 'windows-nt))
    (progn
      (require 'exec-path-from-shell)
      (exec-path-from-shell-initialize)
      ))

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
(load (concat dotspacemacs-directory "myXml.el"))

;; NOTE: need to install Msys2 because ffip needs find executable
;; http://www.msys2.org/
;; (if (eq system-type 'windows-nt)
    ;; (setq ffip-find-executable "c:\\\\soft\\\\msys64\\\\usr\\\\bin\\\\find"))

(require 'find-file-in-project)

;; do NOT ignore pdf files for searching
(setq ffip-prune-patterns (delete "*.pdf" ffip-prune-patterns))
(require 'focus)

;; put this at last
(load (concat dotspacemacs-directory "functions"))

;; disable company mode in shell
;; (add-hook 'shell-mode-hook (lambda () (company-mode -1)) 'append)

;; (load (concat dotspacemacs-directory "visual-regexp/visual-regexp.el"))
;; (load (concat dotspacemacs-directory "visual-regexp-steroids/visual-regexp-steroids.el"))

;; (load (concat dotspacemacs-directory "keyfreq.el"))
;; (require 'keyfreq)
;; (keyfreq-mode 1)
;; (keyfreq-autosave-mode 1)

;; Make script files executable automatically
;; https://www.masteringemacs.org/article/script-files-executable-automatically
(add-hook 'after-save-hook   'executable-make-buffer-file-executable-if-script-p)

;; http://sachachua.com/blog/2017/04/emacs-pasting-with-the-mouse-without-moving-the-point-mouse-yank-at-point/
(setq mouse-yank-at-point t)

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

;; stop inserting \ for not paired quote
(setq sp-autoescape-string-quote "off")

(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)
(setq revert-without-query '(".*")) ;; disable revert query

(defun font-lock-comment-annotations ()
  "Highlight a bunch of well known comment annotations.
This functions should be added to the hooks of major modes for programming."
  (font-lock-add-keywords
   nil
   '(("\\<\\(FIX\\(ME\\)?\\|BUG\\|HACK\\):" 1 font-lock-warning-face t)
     ("\\<\\(NOTE\\):" 1 'org-level-2 t)
     ("\\<\\(TODO\\):" 1 'org-todo t)
     ("\\<\\(DONE\\):" 1 'org-done t))
   ))

(add-hook 'prog-mode-hook 'font-lock-comment-annotations)

(spacemacs/set-leader-keys "al" 'ace-link)

(add-to-list 'load-path (concat dotspacemacs-directory "external/bookmark-plus"))
(require 'bookmark+)

(spacemacs/set-leader-keys "om" 'bookmark-set)
(spacemacs/set-leader-keys "ol" 'bookmark-bmenu-list)
(spacemacs/set-leader-keys "ou" 'bmkp-url-target-set)
(spacemacs/set-leader-keys "ow" 'bmkp-url-jump)
(spacemacs/set-leader-keys "of" 'bmkp-non-dir-file-jump)
(spacemacs/set-leader-keys "od" 'bmkp-dired-jump)
(spacemacs/set-leader-keys "or" 'bmkp-remote-file-jump)
(spacemacs/set-leader-keys "os" 'bmkp-set-snippet-bookmark)
(spacemacs/set-leader-keys "oa" 'bmkp-annotate-bookmark)
(spacemacs/set-leader-keys "ok" 'bmkp-snippet-to-kill-ring)

;; fix the error that bmkp-info-cp is void
(defalias 'bmkp-info-cp 'bmkp-info-node-name-cp)

(spacemacs/set-leader-keys "hv" 'counsel-describe-variable)
(spacemacs/set-leader-keys "hk" 'describe-key)
(spacemacs/set-leader-keys "hm" 'describe-mode)
(spacemacs/set-leader-keys "hf" 'counsel-describe-function)
(spacemacs/set-leader-keys "hi" 'info)

;; https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
(setq display-time-world-list
        '(("America/New_York" "New York")
          ("Asia/Shanghai" "Shanghai")
          ("Australia/Sydney" "Sydney")
          ("Europe/London" "London")
          ("Europe/Berlin" "Germany")
          ("Europe/Rome" "Italy")
          ("Europe/Paris" "Paris")))

;; quick way to dispaly world time clock
(defalias 'wc 'display-time-world)

;; these two functions are used too frequently,
;; so define them to reduce keystrokes
(spacemacs/set-leader-keys "m" 'evil-avy-goto-char-2)
(spacemacs/set-leader-keys "d" 'counsel-git-grep)
(spacemacs/set-leader-keys "q" 'ivy-switch-buffer)

(spacemacs/set-leader-keys "jm" 'evil-show-marks)
(spacemacs/set-leader-keys "jr" 'evil-show-registers)

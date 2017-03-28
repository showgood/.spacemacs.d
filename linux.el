;; (global-linum-mode t)
(global-company-mode t)
(load (concat dotspacemacs-directory "keys"))
(load (concat dotspacemacs-directory "bb.el"))
(load (concat dotspacemacs-directory "dired+.el"))
(load (concat dotspacemacs-directory "typeless.el"))
(load (concat dotspacemacs-directory "myivy.el"))
(load (concat dotspacemacs-directory "functions.el"))
(load (concat dotspacemacs-directory "comdb2-sql3.el"))
(load (concat dotspacemacs-directory "myediff.el"))
(setq eshell-directory-name (concat dotspacemacs-directory "eshell_linux"))
(add-hook 'shell-mode-hook (lambda () (company-mode -1)) 'append)

(setq x-select-enable-clipboard t)
(load (concat dotspacemacs-directory "projectile.el"))

;; Treat clipboard input as UTF-8 string first; compound text next, etc.
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

(setq diredp-hide-details-initially-flag nil)
(setq delete-by-moving-to-trash nil)
(setq line-move-visual t)
(semantic-mode 1) ;; -> this is optional for Lisp

(require 'ansi-color)
(setq ansi-color-for-comint-mode t)
(setq term-buffer-maximum-size 0)

;; (defun eshell/clear ()
;;   "Clear the eshell buffer."
;;   (let ((inhibit-read-only t))
;;     (erase-buffer)
;;     (eshell-send-input)))

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
(setq tab-width 4)

;; https://github.com/fniessen/emacs-leuven/blob/master/emacs-leuven.el
(defun leuven-vc-dir-hide-up-to-date-and-unregistered ()
    (interactive)
    (vc-dir-hide-up-to-date)
    (vc-dir-hide-unregistered))

(defun vc-dir-hide-unregistered ()
    "Hide unregistered items from display."
    (interactive)
    (let ((crt (ewoc-nth vc-ewoc -1))
          (first (ewoc-nth vc-ewoc 0)))
      ;; Go over from the last item to the first and remove the unregistered
      ;; files and directories with no child files.
      (while (not (eq crt first))
        (let* ((data (ewoc-data crt))
               (dir (vc-dir-fileinfo->directory data))
               (next (ewoc-next vc-ewoc crt))
               (prev (ewoc-prev vc-ewoc crt))
               ;; ewoc-delete does not work without this...
               (inhibit-read-only t))
          (when (or
                 ;; Remove directories with no child files.
                 (and dir
                      (or
                       ;; Nothing follows this directory.
                       (not next)
                       ;; Next item is a directory.
                       (vc-dir-fileinfo->directory (ewoc-data next))))
                 ;; Remove files in the unregistered state.
                 (eq (vc-dir-fileinfo->state data) 'unregistered))
            (ewoc-delete vc-ewoc crt))
          (setq crt prev)))))

  (defun vc-ediff-ignore-whitespace (historic &optional not-urgent)
    "Ignore regions that differ in white space & line breaks only."
    (interactive (list current-prefix-arg t))
    (require 'ediff)
    (let ((ediff-ignore-similar-regions t))
      (call-interactively 'vc-ediff)))  ; XXX does not work yet!

(add-hook  'vc-dir-mode-hook
             (lambda ()
               ;; Hide up-to-date and unregistered files.
               (define-key vc-dir-mode-map
                 (kbd "x") #'leuven-vc-dir-hide-up-to-date-and-unregistered)
               (define-key vc-dir-mode-map
                 (kbd "E") #'vc-ediff)
               (define-key vc-dir-mode-map
                 (kbd "#") #'vc-ediff-ignore-whitespace)
                                         ; ediff-windows-wordwise?
               ))

(add-hook  'vc-svn-log-view-mode-hook
           (lambda ()
             (define-key vc-svn-log-view-mode-map
               (kbd "E") #'vc-ediff)
             (define-key vc-svn-log-view-mode-map
               (kbd "#") #'vc-ediff-ignore-whitespace)
                                        ; ediff-windows-wordwise?
             ))

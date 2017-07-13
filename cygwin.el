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

;; https://www.gnu.org/software/emacs/manual/html_node/tramp/Password-handling.html
;; store the password for a period of time, helpful in the TRAMP case
(setq password-cache-expiry nil)

;;http://carloerodriguez.com/blog/2015/12/14/effective-ssh-connections-with-emacs/
;; make tramp work with projectile
(defadvice projectile-project-root (around ignore-remote first activate)
  (unless (file-remote-p default-directory) ad-do-it))

(defun nylx ()
  (interactive)
  (let ((default-directory "/toolkit:xwu157@nylxdev6:/home/xwu157/big"))
    (shell)))

(defun trsl ()
  (interactive)
  (let ((default-directory "/toolkit:xwu157@trslnjdtraap01:/home/xwu157"))
    (shell)))

(defun njts ()
  (interactive)
  (let ((default-directory "/toolkit:xwu157@njtsdev1:/home/xwu157/big"))
    (shell)))

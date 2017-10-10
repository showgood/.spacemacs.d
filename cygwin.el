(require 'tramp)
(set-default 'tramp-auto-save-directory "~/tmp")
(setq tramp-inline-compress-start-size 10000000)
(add-to-list 'tramp-remote-path 'tramp-own-remote-path)

(load (concat dotspacemacs-directory "common.el"))
(load (concat dotspacemacs-directory "toolkit-tramp.el"))
(load (concat dotspacemacs-directory "bb.el"))
(load (concat dotspacemacs-directory "mytramp.el"))
(load (concat dotspacemacs-directory "myOrg.el"))

(setq org-agenda-files (quote ("/cygdrive/c/wxm/gtd")))
(setq org-directory "/cygdrive/c/wxm/gtd")
(setq org-default-notes-file "/cygdrive/c/wxm/gtd/Inbox.org")
(setq org-archive-location "/cygdrive/c/wxm/gtd/logbook.org::* Archived")

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
    (shell (get-buffer-create "nylx"))))

(defun trsl ()
  (interactive)
  (let ((default-directory "/toolkit:xwu157@trslnjdtraap01:/home/xwu157"))
    (shell)))

(defun njts ()
  (interactive)
  (let ((default-directory "/toolkit:xwu157@njtsdev1:/home/xwu157/big"))
    (shell)))

(load (concat dotspacemacs-directory "org-bbg.el"))
;; (require 'org-bbg)
(require 'w32-browser)

(setq org-file-apps org-file-apps-defaults-windowsnt)

;; (setq rtags-socket-file "/toolkit:xwu157@nylxdev6:/home/xwu157/.rdm")
(setq rtags-socket-file "/home/xwu157/.rdm")
(setq rtags-tramp-enabled t)
(add-to-list 'tramp-remote-path "/home/xwu157/tools")
(setq rtags-path "/home/xwu157/tools")
;; (add-to-list 'tramp-remote-path "/location/of/rtags/bin")

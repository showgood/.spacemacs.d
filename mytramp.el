;; http://emacs.stackexchange.com/questions/27/how-can-i-use-my-local-emacs-client-as-the-editor-for-remote-machines-i-access
(require 'with-editor)

;; (load (concat dotspacemacs-directory "with-editor.el"))

(add-hook 'shell-mode-hook  'with-editor-export-editor)
(add-hook 'term-mode-hook   'with-editor-export-editor)
(add-hook 'eshell-mode-hook 'with-editor-export-editor)


;; http://emacs.stackexchange.com/questions/15208/using-tramp-for-logs?rq=1
;; auto-revert-tail-mode is great, but it has its limits. Therefore
;; I prefer to use an asynchronous shell command. Open the remote
;; directory in dired, position the cursor to the file you want to
;; watch, and apply ! tail -f * &.

;; If you want to suppress Tramp messages, decrease the
;; verbosity. (setq tramp-verbose 1) shall be sufficient.

;; http://emacs.stackexchange.com/questions/17543/tramp-mode-is-much-slower-than-using-terminal-to-ssh
(setq projectile-mode-line "Projectile")

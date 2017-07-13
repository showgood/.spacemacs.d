;; disable company mode in shell
(add-hook 'shell-mode-hook (lambda () (company-mode -1)) 'append)

(add-hook 'shell-mode-hook
          (lambda ()
            (define-key shell-mode-map (kbd "<up>") 'comint-previous-input)
            (define-key shell-mode-map (kbd "<down>") 'comint-next-input)))

(defun comint-clear-buffer ()
  (interactive)
  (let ((comint-buffer-maximum-size 0))
    (comint-truncate-buffer)))

(add-hook 'comint-mode-hook (lambda () (define-key comint-mode-map "\C-c\M-o" #'comint-clear-buffer)))

;; https://www.quora.com/What-does-Tikhon-Jelviss-Emacs-setup-look-like
;; https://github.com/tikhonjelvis/dotfiles
;; I want an easy command for opening new shells:
(defun new-shell (name)
  "Opens a new shell buffer with the given name in
asterisks (*name*) in the current directory and changes the
prompt to 'name>'."
  (interactive "sName: ")
  (pop-to-buffer (concat "*" name "*"))
  (unless (eq major-mode 'shell-mode)
    (shell (current-buffer))
    (sleep-for 0 200)
    (delete-region (point-min) (point-max))
    (comint-simple-send (get-buffer-process (current-buffer))
                        (concat "export PS1=\"\033[33m" name "\033[0m:\033[35m\\W\033[0m>\""))))
(global-set-key (kbd "C-c s") 'new-shell)

;; https://superuser.com/questions/841178/directly-open-remote-shell-with-tramp-in-emacs
;; (new-shell "/ssh:vagrant@localhost#2222:/vagrant/")

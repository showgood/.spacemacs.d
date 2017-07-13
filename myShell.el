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

;;; https://github.com/philippe-grenet/exordium/blob/master/modules/init-shell.el
;;; This is needed so that clearing shell buffer works as expected
(remove-hook 'comint-output-filter-functions
             'comint-postoutput-scroll-to-bottom)

;;; Display colors in shell
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(custom-set-variables
 '(comint-scroll-to-bottom-on-input t)  ; always insert at the bottom
 '(comint-scroll-to-bottom-on-output nil) ; always add output at the bottom
 '(comint-scroll-show-maximum-output t) ; scroll to show max possible output
 '(comint-input-ignoredups t)           ; no duplicates in command history
 '(comint-completion-addsuffix t)       ; insert space after file completion
 '(comint-buffer-maximum-size 20000)    ; max length of the buffer in lines
 '(comint-prompt-read-only nil)         ; if this is t, it breaks shell-command
 '(comint-get-old-input (lambda () "")) ; what to run when I press enter on a
                                        ; line above the current prompt
 '(comint-input-ring-size 5000)         ; max shell history size
 '(protect-buffer-bury-p nil)
)

;;; Clear the buffer
(defun clear-buffer ()
  "Clears the current buffer, removing all its content"
  (interactive)
  (let ((comint-buffer-maximum-size 0))
    (comint-truncate-buffer)))

;;; Set $PAGER to `cat` instead of `less` etc in shell mode
(setenv "PAGER" "cat")

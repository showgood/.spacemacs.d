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

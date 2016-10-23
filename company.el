(require 'company)

(add-hook 'after-init-hook 'global-company-mode)

;; Don't enable company-mode in below major modes, OPTIONAL
(setq company-global-modes '(not eshell-mode comint-mode erc-mode rcirc-mode))

;; "text-mode" is a major mode for editing files of text in a human language"
;; most major modes for non-programmers inherit from text-mode
;; (defun text-mode-hook-setup ()
;;   ;; make `company-backends' local is critcal
;;   ;; or else, you will have completion in every major mode, that's very annoying!
;;   (make-local-variable 'company-backends)

;;   ;; company-ispell is the plugin to complete words
;;   (add-to-list 'company-backends 'company-ispell)

;;   ;; OPTIONAL, if `company-ispell-dictionary' is nil, `ispell-complete-word-dict' is used
;;   ;;  but I prefer hard code the dictionary path. That's more portable.
;;   (setq company-ispell-dictionary (file-truename "~/dotspacemacs/english-words.txt")))

;; (add-hook 'text-mode-hook 'text-mode-hook-setup)

;; (defun toggle-company-ispell ()
;;   (interactive)
;;   (cond
;;    ((memq 'company-ispell company-backends)
;;     (setq company-backends (delete 'company-ispell company-backends))
;;     (message "company-ispell disabled"))
;;    (t
;;     (add-to-list 'company-backends 'company-ispell)
;;     (message "company-ispell enabled!"))))


;; ;; (global-set-key (kbd "M-/") 'hippie-expand)

;; ;; ;; The actual expansion function
;; ;; (defun try-expand-by-dict (old)
;; ;;   ;; old is true if we have already attempted an expansion
;; ;;   (unless (bound-and-true-p ispell-minor-mode)
;; ;;     (ispell-minor-mode 1))

;; ;;   ;; english-words.txt is the fallback dicitonary
;; ;;   (if (not ispell-alternate-dictionary)
;; ;;       (setq ispell-alternate-dictionary (file-truename "~/dotspacemacs/english-words.txt")))
;; ;;   (let ((lookup-func (if (fboundp 'ispell-lookup-words)
;; ;;                        'ispell-lookup-words
;; ;;                        'lookup-words)))
;; ;;     (unless old
;; ;;       (he-init-string (he-lisp-symbol-beg) (point))
;; ;;       (if (not (he-string-member he-search-string he-tried-table))
;; ;;         (setq he-tried-table (cons he-search-string he-tried-table)))
;; ;;       (setq he-expand-list
;; ;;             (and (not (equal he-search-string ""))
;; ;;                  (funcall lookup-func (concat (buffer-substring-no-properties (he-lisp-symbol-beg) (point)) "*")))))
;; ;;     (if (null he-expand-list)
;; ;;       (if old (he-reset-string))
;; ;;       (he-substitute-string (car he-expand-list))
;; ;;       (setq he-expand-list (cdr he-expand-list))
;; ;;       t)
;; ;;     ))

;; ;; (setq hippie-expand-try-functions-list
;; ;;       '(;; try-expand-dabbrev
;; ;;         ;; try-expand-dabbrev-all-buffers
;; ;;         try-expand-by-dict))

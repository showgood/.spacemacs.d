;; (add-to-list 'load-path "~/dotspacemacs/semantic-refactor")
;; (require 'srefactor)
;; (require 'srefactor-lisp)

;; OPTIONAL: ADD IT ONLY IF YOU USE C/C++. 
(semantic-mode 1) ;; -> this is optional for Lisp

(add-to-list 'load-path (concat dotspacemacs-directory "function-args"))

;; (require 'function-args)
;; (fa-config-default)

;;http://www.josephlisee.com/2015/02/21/exploring-clang-format/
(defun clang-format-before-save ()
  (add-hook 'before-save-hook 'clang-format-before-save)
  (interactive) (when (eq major-mode 'c++-mode) (clang-format-buffer)))

;; Install hook to use clang-format on save
(add-hook 'before-save-hook 'clang-format-before-save)

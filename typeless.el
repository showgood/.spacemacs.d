;; (setq yas-snippet-dirs (append yas-snippet-dirs
;;       '("~/dotspacemacs/snippets")))

;; (setq yas-snippet-dirs '((concat dotspacemacs-directory "snippets")))

;; still not quite working..
;; after this, snippet will be shown, but candidates for
;; auto completion is not shown..
(defvar company-mode/enable-yas t
  "Enable yasnippet for all backends.")

(defun company-mode/backend-with-yas (backend)
  (if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
      backend
    (append (if (consp backend) backend (list backend))
            '(:with company-yasnippet))))

(setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))

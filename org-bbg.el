 ;;; org-bbg.el - Support for links to bb terminal in Org

(require 'org)

;; http://orgmode.org/manual/Adding-hyperlink-types.html
(org-add-link-type "bbg" 'org-bbg-open)
;; (add-hook 'org-store-link-functions 'org-bbg-store-link)

;; This uses the BbgProtocolHandler set up by the terminal;
;; bbg: links should be supported
(defun org-bbg-open (link)
  "Launch the Bloomberg Terminal with the given function"
  (browse-url (concat "bbg://screens/" link)))
;; http://www.draketo.de/light/english/free-software/custom-link-completion-org-mode-25-lines-emacs

;; (defun org-bbg-store-link ()
;;   "Store a link to a manpage."
;;   (when (memq major-mode '(Man-mode woman-mode))
;;     ;; This is a man page, we do make this link
;;     (let* ((page (org-man-get-page-name))
;;            (link (concat "man:" page))
;;            (description (format "Manpage for %s" page)))
;;       (org-store-link-props
;;        :type "man"
;;        :link link
;;        :description description))))

(provide 'org-bbg)
;;; org-bbg.el ends here

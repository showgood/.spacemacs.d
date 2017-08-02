(defun eshell/clear ()
  "Clear the eshell buffer."
  (let ((inhibit-read-only t))
    (erase-buffer)
    (eshell-send-input)))

(defun comint-clear-buffer ()
  (interactive)
  (let ((comint-buffer-maximum-size 0))
    (comint-truncate-buffer)))

(add-hook 'comint-mode-hook (lambda () (define-key comint-mode-map "\C-c\M-o" #'comint-clear-buffer)))

(defun sum-cua-rectangle ()
  ;; Treat the content of current cua rectangle as numbers, and
  ;; calculate sum.
  (interactive)
  (message
   (number-to-string
    (reduce (lambda (x y) (+ x y))
            (mapcar (lambda (n) (string-to-number n))
                    (cua--extract-rectangle))))))

;; replace current word or selection using vim style for evil mode
;; author: showgood
(defun evil-replace-word-selection()
  "replace current word or selection using vim style for evil mode"
  (interactive)
  (if (use-region-p)
      (let (
            (selection (buffer-substring-no-properties (region-beginning) (region-end))))
        (if (= (length selection) 0)
          (message "empty string")
          (evil-ex (concat "'<,'>s/" selection "/"))
        ))
    (evil-ex (concat "%s/" (thing-at-point 'word) "/"))))

(defun Open ()
  "Show current file in desktop (OS's file manager).
URL `http://ergoemacs.org/emacs/emacs_dired_open_file_in_ext_apps.html'
Version 2015-06-12"
  (interactive)
  (cond
   ((string-equal system-type "windows-nt")
    (w32-shell-execute "explore" (replace-regexp-in-string "/" "\\" default-directory t t)))
   ((string-equal system-type "cygwin")
    (w32-shell-execute "explore" default-directory ))
   ((string-equal system-type "darwin") (shell-command "open ."))
   ((string-equal system-type "gnu/linux")
    (let ((process-connection-type nil)) (start-process "" nil "xdg-open" "."))
    ;; (shell-command "xdg-open .") ;; 2013-02-10 this sometimes froze emacs till the folder is closed. ⁖ with nautilus
    )))

;; insert current time
;; source: http://emacswiki.org/emacs/InsertingTodaysDate
(defun nnow ()
  (interactive)
  (insert (format-time-string "%Y-%b-%d %H:%M:%S")))

;; insert today date
(defun ddate ()
  (interactive)
  (insert (format-time-string "%Y-%b-%d")))


(defun close-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))

; support open link for evernote or outlook etc
;; (defun org-pass-link-to-system (link)
;;   (if (string-match "^[a-zA-Z0-9]+:" link)
;;       (browse-url link)
;;     nil)
;;   )

;; (add-hook 'org-open-link-functions 'org-pass-link-to-system)

;;soure:https://github.com/redguardtoo/emacs.d/blob/master/lisp/init-clipboard.el
;; only copy file name (not including path)
(defun cp-filename-of-current-buffer ()
  "Copy file name (NOT full path) into the yank ring and OS clipboard"
  (interactive)
  (let (filename)
    (when buffer-file-name
      (setq filename (file-name-nondirectory buffer-file-name))
      (kill-new filename)
      (message "filename %s => clipboard & yank ring" filename))))

;; quickly dupliate a line without changing the kill-ring
;; http://stackoverflow.com/questions/88399/how-do-i-duplicate-a-whole-line-in-emacs
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
  (pop kill-ring)
)

;; (defun my-join-line()
;;   (interactive)
;;   (move-beginning-of-line 1)
;;   (next-line 1)
;;   (delete-indentation)
;; )

;; from AbcDef ==> Abc_Def
(defun split-name (s)
  (split-string
   (let ((case-fold-search nil))
     (downcase
      (replace-regexp-in-string "\\([a-z]\\)\\([A-Z]\\)" "\\1 \\2" s)))
   "[^A-Za-z0-9]+"))
(defun underscore-string (s) (mapconcat 'downcase   (split-name s) "_"))

;; (defun put-in-src-block (type)
;;   (yank)
;;   (let
;;       ((prefix "")
;;        (postfix "")
;;        (result ""))
;;   (cond
;;    ((string= type "e")
;;     (setq prefix "#+BEGIN_EXAMPLE")
;;     (setq posfix "#+END_EXAMPLE")
;;    (setq result (concat prefix "\n" (substring-no-properties (current-kill 0)) postfx))
;;    (message result))
;;    ((string= type "s")
;;     (setq prefix "#+BEGIN_SRC")
;;     (setq postfix "#+END_SRC")
;;    (t (message "wrong choice"))
;;    )
;;   )
;;   )

(defun A()
  "open the corresponding header/cpp file, like A plugin in vim"
  (interactive)
  (split-window-right-and-focus)
  (ff-find-other-file)
)

(defun a()
  "open the corresponding header/cpp file in current buffer"
  (interactive)
  (ff-find-other-file)
)

(defun xml-reformat()
  "reformat the xml file using xmllint"
  (interactive)

  (shell-command
   (format "xmllint --format %s"
           (shell-quote-argument (buffer-file-name)))

   ;; name of output buffer
   (current-buffer)
   ;; name of the error buffer
   "*XMl reformat Error Buffer*"
   ))

(defun read-lines (filePath)
  "Return a list of lines of a file at filePath."
  (with-temp-buffer
    (insert-file-contents filePath)
    (split-string (buffer-string) "\n" t)))

(defun extract-bas-codegen-command (fileContent)
  (require 'cl)
    (car (cl-remove-if-not 'contain-bas-codegen? fileContent))
)

(defun trim-left-bas-code-gen (line)
  (subseq line (contain-bas-codegen? line))
)

(defun trim-right-bas-code-gen (line)
  (subseq line 0 (+ 4 (search ".xsd" line)))
)

(defun contain-bas-codegen? (line)
  (search "bas_codegen.pl" line)
)

(defun bas-code-gen ()
  "run bas_codegen on current buffer by extracting the command from file content"
  (interactive)

  (shell-command
   (trim-right-bas-code-gen
    (trim-left-bas-code-gen
     (extract-bas-codegen-command
      (read-lines
                  (shell-quote-argument (buffer-file-name))
      ))))

   ;; name of output buffer
   "*Bas code gen output Buffer*"
   ;; name of the error buffer
   "*Bas code gen Error Buffer*"
))

;; https://superuser.com/questions/546619/clear-the-kill-ring-in-emacs
(defun clear-kill-ring ()
  (interactive)
  (progn (setq kill-ring nil) (garbage-collect))
  )

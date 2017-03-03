(defun eshell/clear ()
  "Clear the eshell buffer."
  (let ((inhibit-read-only t))
    (erase-buffer)
    (eshell-send-input)))

(defun sum-cua-rectangle ()
  ;; Treat the content of current cua rectangle as numbers, and
  ;; calculate sum.
  (interactive)
  (message
   (number-to-string
    (reduce (lambda (x y) (+ x y))
            (mapcar (lambda (n) (string-to-number n))
                    (cua--extract-rectangle))))))

; replace current word or selection using vim style for evil mode
; author: showgood
;; (defun evil-replace-word-selection()
;;   "replace current word or selection using vim style for evil mode"
;;   (interactive)
;;   (if (use-region-p)
;;       (let (
;;             (selection (buffer-substring-no-properties (region-beginning) (region-end))))
;;         (if (= (length selection) 0)
;;           (message "empty string")
;;           (evil-ex (concat "'<,'>s/" selection "/"))
;;         ))
;;     (evil-ex (concat "%s/" (thing-at-point 'word) "/"))))

(defun Open ()
  "Show current file in desktop (OS's file manager).
URL `http://ergoemacs.org/emacs/emacs_dired_open_file_in_ext_apps.html'
Version 2015-06-12"
  (interactive)
  (cond
   ((string-equal system-type "windows-nt")
    (w32-shell-execute "explore" (replace-regexp-in-string "/" "\\" default-directory t t)))
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
;; (require 'ido) ; part of emacs

;; (load (concat dotspacemacs-directory "hot-filelist"))

;; (defun xah-open-file-fast ()
;;   "Prompt to open a file from `hot-filelist'.
;; URL `http://ergoemacs.org/emacs/emacs_hotkey_open_file_fast.html'
;; Version 2015-04-23"
;;   (interactive)
;;   (let ((ξabbrevCode
;;          (ido-completing-read "Open:" (mapcar (lambda (ξx) (car ξx)) hot-filelist))))
;;     (find-file (cdr (assoc ξabbrevCode hot-filelist)))))

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

(defun open-my-inbox()
  (interactive)
  (find-file "~/org/Inbox.org")
  )

(defun open-my-todo-list()
  (interactive)
  (find-file "~/org/gtd/todo.org")
  )

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

;; copy whole line
;; http://stackoverflow.com/questions/88399/how-do-i-duplicate-a-whole-line-in-emacs
;; (defun duplicate-line()
;;   (interactive)
;;   (move-beginning-of-line 1)
;;   (kill-line)
;;   (yank)
;;   (open-line 1)
;;   (next-line 1)
;;   (yank)
;; )

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

;; #+BEGIN_SRC elisp

  ;; (if (string= "e")
  ;;     (message "example"))
  ;; (kill-new
  ;;  (concat "#+start\n"
  ;;          (substring-no-properties (current-kill 0)) "\n #+end\n"))
  ;; )

(defun A()
  "open the corresponding header/cpp file, like A plugin in vim"
  (interactive)
  (split-window-right-and-focus)
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

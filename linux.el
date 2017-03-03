(load (concat dotspacemacs-directory "common.el"))
(load (concat dotspacemacs-directory "bb.el"))
(setq eshell-directory-name (concat dotspacemacs-directory "eshell_linux"))

(setq x-select-enable-clipboard t)

;; Treat clipboard input as UTF-8 string first; compound text next, etc.
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

(require 'ansi-color)
(setq ansi-color-for-comint-mode t)
(setq term-buffer-maximum-size 0)
(load (concat dotspacemacs-directory "json-reformat.el"))

(defun eshell/clear ()
  "Clear the eshell buffer."
  (let ((inhibit-read-only t))
    (erase-buffer)
    (eshell-send-input)))

(org-babel-do-load-languages
 'org-babel-load-languages
 '( (perl . t)
    (ruby . t)
    (plantuml . t)
    (ditaa . t)
    (sh . t)
    (python . t)
    (dot . t)
    (C . t)
    (js . t)
    (emacs-lisp . t)
    ))

(setq org-plantuml-jar-path "~/soft/plantuml.8033.jar")
(setq tab-width 4)

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

(defun A()
  "open the corresponding header/cpp file, like A plugin in vim"
  (interactive)
  (split-window-right-and-focus)
  (ff-find-other-file)
)

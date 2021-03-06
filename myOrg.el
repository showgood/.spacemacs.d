;; export to Markdown
(require 'ox-md)

;; export to github flavor markdown
(require 'ox-gfm)

;;; Show org-mode bullets as UTF-8 characters.
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(setq org-todo-keywords '((sequence "☛ TODO(t)" "|" "✔ DONE(d)")
                          (sequence "⚑ WAITING(w)" "|")
                          (sequence "|" "✘ CANCELED(c)")))

(setq org-link-abbrev-alist
      '(("google" . "http://www.google.com/search?q=")
        ("google-map" . "http://maps.google.com/maps?q=%s")
        ))

;; make agenda show on current window
(setq org-agenda-window-setup 'current-window)
;; highlight current in agenda
(add-hook 'org-agenda-mode-hook 'hl-line-mode)
;; Use current window when switch to source block
(setq org-src-window-setup 'current-window)
;; Disable prompting to evaluate babel blocks
(setq org-confirm-babel-evaluate nil)
;; Disable add validation link when export to HTML
(setq org-html-validation-link nil)

(setq org-html-table-default-attributes '(:border "2" :rules "all" :frame "border"))
(setq org-startup-indented t)

;; always use relative path link, very important
;; https://emacs.stackexchange.com/questions/16652/change-the-behavior-of-org-mode-auto-expand-relative-path-in-link
(setq org-link-file-path-type 'relative)

(setq org-src-fontify-natively t)
(setq org-startup-with-inline-images t)

;; Setup files for agenda
;; Always use `C-g' to exit agenda
;; (add-hook 'org-agenda-mode-hook
;;           '(lambda ()
;;              (local-set-key (kbd "C-g") 'org-agenda-exit)))

(setq org-agenda-files (quote ("~/org/gtd/"
                               "~/org/Inbox.org"
                               "~/org/habit.org"
                               "~/org/birthday.org")))

(setq org-directory "~/org")
(setq org-default-notes-file "~/org/Inbox.org")
(setq org-archive-location "~/org/logbook.org::* Archived")

(setq org-ditaa-jar-path "~/soft/ditaa0_9.jar")
(setq org-plantuml-jar-path "~/soft/plantuml.8033.jar")
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
    (scheme . t)
    ))

(setq org-capture-templates
      (quote (("t" "todo" entry (file "Inbox.org")
               "* TODO %?\n:PROPERTIES:\n:CREATED: %U\n:END:\n%a\n")
              ("r" "respond" entry (file "Inbox.org")
               "* NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n" :immediate-finish t)
              ("n" "note" entry (file "Inbox.org")
               "* %? :NOTE:\n:PROPERTIES:\n:CREATED: %U\n:END:\n%a\n")
              ("j" "Journal" entry (file+datetree "~/git/org/diary.org")
               "* %?\n%U\n")
              ;; ("w" "org-protocol" entry (file "~/org/Inbox.org")
              ;;  "* TODO Review %c\n%U\n" :immediate-finish t)
              ("w" "Web site" entry
               (file "")
               "* %a :website:\n\n%U %?\n\n%:initial")
              ("m" "Meeting" entry (file "Inbox.org")
               "* MEETING with %? :MEETING:\n:PROPERTIES:\n:CREATED: %U\n:END:\n")
              ("a" "Appointment" entry (file "Inbox.org")
               "* Appointment with %? :APPOINTMENT:\n:PROPERTIES:\n:CREATED: %U\n:END:\n")
              ("p" "Phone call" entry (file "Inbox.org")
               "* PHONE %? :PHONE:\n:PROPERTIES:\n:CREATED: %U\n:END:\n")
              ("c" "Contacts" entry (file "contacts.org")
                "* %(org-contacts-template-name) \n:PROPERTIES:\n:EMAIL: %(org-contacts-template-email)\n:END:\n")
              ("l" "Link" entry
                 (file "~/org/rss.org")
                 "* %a\n%U")
              ("h" "Habit" entry (file "Inbox.org")
               "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n"))))
                                        ; Targets include this file and any file contributing to the agenda - up to 9 levels deep

(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))
(setq org-refile-use-outline-path 'file)

;; http://dept.stat.lsa.umich.edu/~jerrick/org_agenda_calendar.html
;; (add-hook 'org-finalize-agenda-hook
;;           (lambda ()
;;             (save-excursion
;;               (color-org-header "Personal:"  "green")
;;               (color-org-header "Birthdays:" "gold")
;;               (color-org-header "Holidays:" "chocolate"))))

;; (defun color-org-header (tag col)
;;   ""
;;   (interactive)
;;   (goto-char (point-min))
;;   (while (re-search-forward tag nil t)
;;     (add-text-properties (match-beginning 0) (point-at-eol)
;;                          `(face (:foreground ,col)))))
; follow the link using enter
;; (setq org-return-follows-link t)

(setq org-agenda-start-on-weekday 0)

;;http://doc.norang.ca/org-mode.html
;; Remove empty LOGBOOK drawers on clock out
(defun bh/remove-empty-drawer-on-clock-out ()
  (interactive)
  (save-excursion
    (beginning-of-line 0)
    (org-remove-empty-drawer-at "LOGBOOK" (point))))

;; (add-hook 'org-clock-out-hook 'bh/remove-empty-drawer-on-clock-out 'append)
(require 'org-contacts)
(setq org-contacts-files (quote ("~/org/contacts.org")))

(setq org-confirm-babel-evaluate nil)

;http://orgmode.org/manual/Code-evaluation-security.html
(defun my-org-confirm-babel-evaluate (lang body)
  (not (string= lang "ditaa")))  ; don't ask for ditaa

;; This one is for the beginning char
(setcar org-emphasis-regexp-components " \t('\" {")
;; This one is for the ending char.
(setcar (nthcdr 1 org-emphasis-regexp-components) "- \t.,: !?;'\")}\\")
(setq org-export-with-properties t)
(setq org-export-with-clocks t)

;(require 'org-drill)
;(setq org-drill-learn-fraction 0.3)
;; (setq org-drill-spaced-repetition-algorithm 'Simple8)
;; https://punchagan.muse-amuse.in/posts/org-drill-for-making-it-stick.html

;; https://emacs.stackexchange.com/questions/5889/how-to-highlight-text-permanently-in-org-mode
(add-to-list 'org-emphasis-alist
             '("*" (:emphasis t :foreground "red")
               ))

;; not working, not sure why
;; http://sachachua.com/blog/2012/12/emacs-strike-through-headlines-for-done-tasks-in-org/
;; (setq org-fontify-done-headline t)
;; (custom-set-faces
;;  '(org-done ((t (:foreground "PaleGreen"
;;                              :weight normal
;;                              :strike-through t))))
;;  '(org-headline-done
;;    ((((class color) (min-colors 16) (background dark))
;;      (:foreground "LightSalmon" :strike-through t)))))

;;; Preserve indentation in code blocks
(setq org-src-preserve-indentation t)

;; https://github.com/alphapapa/org-protocol-capture-html
;; only works on Mac
(if (eq system-type 'darwin)
    (progn
      (require 'org-protocol)
      (add-to-list 'load-path (concat dotspacemacs-directory "external/org-protocol-capture-html"))
      (require 'org-protocol-capture-html)
      ))


;; ---------------------
;; org capture in elfeed
;; ---------------------
;; http://dsdshcym.github.io/blog/2016/01/28/add-org-store-link-entry-for-elfeed/
;; store the link to elfeed in org mode
(defun private/org-elfeed-entry-store-link ()
  (when elfeed-show-entry
    (let* ((link (elfeed-entry-link elfeed-show-entry))
           (title (elfeed-entry-title elfeed-show-entry)))
      (org-store-link-props
       :link link
       :description title)
      )))

(add-hook 'org-store-link-functions
          'private/org-elfeed-entry-store-link)

;; archive all DONE tasks in one go
;; https://stackoverflow.com/questions/6997387/how-to-archive-all-the-done-tasks-using-a-single-command
;; change 'file to 'tree operates on current tree instead of whole file
(defun org-archive-done-tasks ()
  (interactive)
  (org-map-entries
   (lambda ()
     (org-archive-subtree)
     (setq org-map-continue-from (outline-previous-heading)))
   "/DONE" 'file))

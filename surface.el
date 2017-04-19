(load (concat dotspacemacs-directory "common.el"))
(setq eshell-directory-name (concat dotspacemacs-directory "eshell_surface"))

(add-to-list 'load-path (concat dotspacemacs-directory "external/paperless"))
(autoload 'paperless "paperless" "A major mode for filing PDFs" t)

(require 'org-drill)

(setq org-startup-indented t)
(setq org-src-fontify-natively t)
(setq org-startup-with-inline-images t)

(setq org-agenda-files (quote ("~/org/gtd/"
                               "~/org/Inbox.org"
                               "~/org/habit.org"
                               "~/org/birthday.org")))
(setq org-directory "~/org")
(setq org-default-notes-file "~/org/Inbox.org")

;; (setq org-journal-dir "~/org/journalOrg/")
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
    ))

(setq org-capture-templates
      (quote (("t" "todo" entry (file "~/org/Inbox.org")
               "* TODO %?\n:PROPERTIES:\n:CREATED: %U\n:END:\n%a\n")

              ("u"
                 "Task: Read this URL"
                 entry
                 (file+headline "readItLater.org" "Articles To Read")
                 ,(concat "* TODO Read article: '%:description'\nURL: %c\n\n")
                 :empty-lines 1
                 :immediate-finish t)

               ("w"
                "Capture web snippet"
                entry
                (file+headline "drill-todo.org" "Inbox")
                 ,(concat "* Fact: '%:description'        :"
                          (format "%s" org-drill-question-tag)
                          ":\n:PROPERTIES:\n:DATE_ADDED: %u\n:SOURCE_URL: %c\n:END:\n\n%i\n%?\n")
                 :empty-lines 1
                 :immediate-finish t)

              ("n" "note" entry (file "~/org/Inbox.org")
               "* %? :NOTE:\n:PROPERTIES:\n:CREATED: %U\n:END:\n%a\n")
              ("j" "Journal" entry (file+datetree "~/git/org/diary.org")
               "* %?\n%U\n")
              ("r" "org-protocol" entry (file "~/org/Inbox.org")
               "* TODO Review %c\n%U\n" :immediate-finish t)
              ("m" "Meeting" entry (file "~/org/Inbox.org")
               "* MEETING with %? :MEETING:\n:PROPERTIES:\n:CREATED: %U\n:END:\n")
              ("a" "Appointment" entry (file "~/org/Inbox.org")
               "* Appointment with %? :APPOINTMENT:\n:PROPERTIES:\n:CREATED: %U\n:END:\n")
              ("p" "Phone call" entry (file "~/org/Inbox.org")
               "* PHONE %? :PHONE:\n:PROPERTIES:\n:CREATED: %U\n:END:\n")
              ("c" "Contacts" entry (file "~/org/contacts.org")
                "* %(org-contacts-template-name) \n:PROPERTIES:\n:EMAIL: %(org-contacts-template-email)\n:END:\n")
              ("h" "Habit" entry (file "~/org/Inbox.org")
               "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n"))))
                                        ; Targets include this file and any file contributing to the agenda - up to 9 levels deep

(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))


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
;; (require 'org-contacts)
;; (setq org-contacts-files (quote ("~/org/contacts.org")))

(setq org-confirm-babel-evaluate nil)
;; (setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)

;http://orgmode.org/manual/Code-evaluation-security.html
(defun my-org-confirm-babel-evaluate (lang body)
  (not (string= lang "ditaa")))  ; don't ask for ditaa

;; This one is for the beginning char
(setcar org-emphasis-regexp-components " \t('\" {")
;; This one is for the ending char.
(setcar (nthcdr 1 org-emphasis-regexp-components) "- \t.,: !?;'\")}\\")
(setq org-export-with-properties t)
(setq org-export-with-clocks t)

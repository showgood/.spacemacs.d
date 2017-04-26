(global-set-key (kbd "<f2>") 'org-clock-goto)
(global-set-key (kbd "<f3>") 'org-clock-in)
(global-set-key (kbd "<f4>") 'org-clock-out)

;; need to change since spacemacs 0.2 since ivy has taken f6
;; toggle between hpp and cpp
;; (global-set-key (kbd "<f7> a") 'projectile-find-other-file)
;; ;; list the buffers for project
(global-set-key (kbd "<f7> b") 'counsel-projectile-switch-to-buffer)
;; ;; find directory within project
(global-set-key (kbd "<f7> c") 'projectile-compile-project)
(global-set-key (kbd "<f7> d") 'counsel-projectile-find-dir)
;; ; find files within project (SPC-p-f)
(global-set-key (kbd "<f7> f") 'counsel-projectile-find-file)
;; ;; open the file under cursor within project (C-c p g)
(global-set-key (kbd "<f7> g") 'projectile-find-file-dwim)
(global-set-key (kbd "<f7> o") 'projectile-find-file-dwim-other-window)
;; ; list all the reference for the current symbol at point
;; (global-set-key (kbd "<f7> r") 'helm-gtags-find-rtag)

;; ;; search through project with grep
(global-set-key (kbd "<f7> s") 'counsel-projectile-ag)

;; ;; find definition using ggtags
(global-set-key (kbd "<f7> t") 'projectile-find-tag)

;; ;; run vc on root directory of project
(global-set-key (kbd "<f7> v") 'projectile-vc)

(global-set-key (kbd "<f5> a") 'org-archive-subtree)
(global-set-key (kbd "<f5> c") 'calendar)
(global-set-key (kbd "<f5> d") 'ace-delete-window)
;open a list of hot file
(global-set-key (kbd "<f5> f") 'xah-open-file-fast)
(global-set-key (kbd "<f5> g") 'gnus)
(global-set-key (kbd "<f5> l") (lambda () (interactive) (list-matching-lines (current-word))))
;open my keybinds file (this file)
(global-set-key (kbd "<f5> m") 'my-key-binds)
(global-set-key (kbd "<f5> r") 'org-refile)
;open a list of shell abbreviation
(global-set-key (kbd "<f5> s") 'xah-shell-commands)

;; join line (M-^)
(global-set-key (kbd "<f5> j") 'my-join-line)
;; delete whole line (C-S-backspace)
(global-set-key (kbd "<f5> k") 'kill-whole-line)

(global-set-key (kbd "<f8>") 'counsel-projectile-find-file)

; copy the filename(without path) for current buffer
(global-set-key (kbd "<f9> c") 'cp-filename-of-current-buffer)
;; copy current line
(global-set-key (kbd "<f9> d") 'duplicate-line)
(global-set-key (kbd "<f9> e") 'eshell)

; list all the files in current folder (SPC-f-f)
(global-set-key (kbd "<f9> f") 'counsel-find-file)
(global-set-key (kbd "<f9> q") 'fill-paragraph)
(global-set-key (kbd "<f9> r") 'rename-buffer)

(global-set-key (kbd "<f10>") 'org-capture)
(global-set-key (kbd "<f11>") 'org-agenda)
(global-set-key (kbd "<f12>") 'org-todo)

(global-set-key (kbd "\C-c +") 'evil-numbers/inc-at-pt); mimic C-a in vim
(global-set-key (kbd "\C-c -") 'evil-numbers/dec-at-pt); mimic C-x in vim
(global-set-key (kbd "M-y") 'counsel-yank-pop)
(global-set-key (kbd "\C-ca") 'org-agenda)
(global-set-key (kbd "\C-cc") 'org-capture)
(global-set-key (kbd "\C-co") 'evil-replace-word-selection)
(global-set-key (kbd "\C-cl") 'org-store-link)
(global-set-key (kbd "\C-cr") 'org-refile)
;; (global-set-key (kbd "\C-cj") 'org-journal-new-entry)

(global-set-key (kbd "\C-xb") 'avy-pop-mark)
(global-set-key (kbd "\C-xc") 'cp-filename-of-current-buffer)
(global-set-key (kbd "\C-xf") 'counsel-git)
(global-set-key (kbd "\C-xg") 'counsel-git-grep)
(global-set-key (kbd "\C-xk") 'kill-this-buffer)
(global-set-key (kbd "\C-xj") 'avy-goto-char-2)
(global-set-key (kbd "\C-xm") 'magit-status)
(global-set-key (kbd "\C-xo") 'ace-window)
(global-set-key (kbd "\C-xp") 'spacemacs/copy-clipboard-to-whole-buffer)
(global-set-key (kbd "\C-xs") 'avy-pop-mark)
(global-set-key (kbd "\C-xw") 'avy-pop-mark)
;; quickly select the content for a xml element for replace
(global-set-key (kbd "\C-xt") 'web-mode-element-content-select)
(global-set-key (kbd "\C-xy") 'spacemacs/show-and-copy-buffer-filename)
(global-set-key (kbd "\C-xY") 'spacemacs/copy-whole-buffer-to-clipboard)

;; need these bindings since in org mode C-c + is binded to something else
(global-set-key (kbd "\C-x=") 'evil-numbers/inc-at-pt)
(global-set-key (kbd "\C-x-") 'evil-numbers/dec-at-pt)

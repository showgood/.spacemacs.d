(add-to-list 'load-path "~/dotspacemacs/hydra")
(require 'hydra)

;; (global-set-key
;;  (kbd "C-p")
;;  (defhydra hydra-project
;;    (:body-pre (helm-projectile-switch-project))
;;    "project"
;;    ("a" projectile-toggle-between-implementation-and-test)
;;    ("b" helm-projectile-switch-to-buffer)
;;    ("c" projectile-compile-project)
;;    ("d" helm-projectile-find-dir)
;;    ("f" helm-projectile-find-file)
;;    ("g" helm-projectile-find-file-dwim)
;;    ("p" helm-projectile-switch-project)
;;    ("r" helm-gtags-find-rtag)
;;    ("t" helm-gtags-find-tag)
;;    ("s" avy-goto-char-2)
;;    ("x" save-buffer)
;;    ("o" switch-window)
;;    ("v" projectile-vc)))

;;https://github.com/abo-abo/hydra/wiki/Emacs
;; I tweak a bit to map to the vi keybinding
(global-set-key
 (kbd "C-f")
 (defhydra hydra-move
   (:body-pre (forward-char))
   "move"
   ("j" next-line)
   ("k" previous-line)
   ("l" forward-char)
   ("h" backward-char)
   ("w" forward-word)
   ("b" backward-word)
   ("a" beginning-of-line)
   ("d" delete-char)
   ("D" kill-word)
   ("e" move-end-of-line)
   ("v" scroll-up-command)
   ("s" avy-goto-char-2)
   ("x" save-buffer)
   ("o" switch-window)
   ;; Converting M-v to V here by analogy.
   ("V" scroll-down-command)
   ("z" recenter-top-bottom)))

(global-set-key
 (kbd "C-b")
 (defhydra hydra-move
   (:body-pre (backward-char))
   "move"
   ("j" next-line)
   ("k" previous-line)
   ("l" forward-char)
   ("h" backward-char)
   ("w" forward-word)
   ("b" backward-word)
   ("a" beginning-of-line)
   ("e" move-end-of-line)
   ("v" scroll-up-command)
   ("s" avy-goto-char-2)
   ("x" save-buffer)
   ("o" switch-window)
   ;; Converting M-v to V here by analogy.
   ("V" scroll-down-command)
   ("z" recenter-top-bottom)))


(global-set-key (kbd "C-c m")
(defhydra hydra-transpose (:color red)
"Transpose"
("c" transpose-chars "characters")
("w" transpose-words "words")
("o" org-transpose-words "Org mode words")
("l" transpose-lines "lines")
("s" transpose-sentences "sentences")
("e" org-transpose-elements "Org mode elements")
("p" transpose-paragraphs "paragraphs")
("t" org-table-transpose-table-at-point "Org mode table")
("q" nil "cancel" :color blue)))

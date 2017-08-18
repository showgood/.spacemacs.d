(add-to-list 'load-path (concat dotspacemacs-directory "external/bookmark-plus"))
(require 'bookmark+)

(spacemacs/set-leader-keys "ou" 'bmkp-url-target-set)
(spacemacs/set-leader-keys "ow" 'bmkp-url-jump)
(spacemacs/set-leader-keys "od" 'bmkp-dired-jump)
(spacemacs/set-leader-keys "of" 'bmkp-non-dir-file-jump)
(spacemacs/set-leader-keys "or" 'bmkp-region-jump)

;; bmkp-annotate-bookmark

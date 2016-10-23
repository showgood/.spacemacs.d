(load (concat dotspacemacs-directory "common.el"))

(set-face-attribute 'default nil :font "-*-Monaco-normal-normal-normal-*-14-*-*-*-m-0-iso10646-1")
(set-frame-font "-*-Monaco-normal-normal-normal-*-14-*-*-*-m-0-iso10646-1" nil t)
(setq eshell-directory-name (concat dotspacemacs-directory "eshell_mac"))

(load (concat dotspacemacs-directory "tramp_mac.el"))
(load (concat dotspacemacs-directory "sicp_mac.el"))

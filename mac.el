(load (concat dotspacemacs-directory "common.el"))

(set-face-attribute 'default nil :font "-*-Monaco-normal-normal-normal-*-14-*-*-*-m-0-iso10646-1")
(set-frame-font "-*-Monaco-normal-normal-normal-*-14-*-*-*-m-0-iso10646-1" nil t)
(setq eshell-directory-name (concat dotspacemacs-directory "eshell_mac"))

(load (concat dotspacemacs-directory "tramp.mac.el"))
(load (concat dotspacemacs-directory "sicp.mac.el"))

(setq scheme-program-name "/Applications/mit-scheme/Contents/Resources/mit-scheme")
(require 'xscheme)
(prodigy-define-service
  :name "Python app"
  :command "python"
  :args '("-m" "SimpleHTTPServer" "6001")
  :cwd "~/"
  :tags '(work)
  :stop-signal 'sigkill
  :kill-process-buffer-on-stop t)

(load (concat dotspacemacs-directory "evil-tweak.el"))
(load (concat dotspacemacs-directory "paperless.el"))

(setq paperless-capture-directory "/Users/showgood/Documents/scan")
(setq paperless-root-directory "/Users/showgood/Documents/docs")

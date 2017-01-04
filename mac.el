(load (concat dotspacemacs-directory "common.el"))

(set-face-attribute 'default nil :font "-*-Monaco-normal-normal-normal-*-14-*-*-*-m-0-iso10646-1")
(set-frame-font "-*-Monaco-normal-normal-normal-*-14-*-*-*-m-0-iso10646-1" nil t)
(setq eshell-directory-name (concat dotspacemacs-directory "eshell_mac"))

(load (concat dotspacemacs-directory "tramp.mac.el"))
(load (concat dotspacemacs-directory "sicp.mac.el"))

(setq scheme-program-name "/Applications/mit-scheme/Contents/Resources/mit-scheme")
(require 'xscheme)
(require 'ox-publish)
(setq org-publish-project-alist
      '(
        ("blog-notes"
         :base-directory "~/org/codingOrg/"
         :base-extension "org"
         :publishing-directory "~/orgPublish/coding/"
         :recursive t
         :publishing-function org-publish-org-to-html
         :headline-levels 4
         :section-numbers nil
         :auto-preamble t
         :auto-sitemap t                ; Generate sitemap.org automagically...
         :sitemap-filename "sitemap.org"  ; ... call it sitemap.org (it's the default)...
         :sitemap-title "Sitemap"         ; ... with title 'Sitemap'.
         :author "showgood"
         :style    "<link rel=\"stylesheet\" type=\"text/css\" href=\"css/worg.css\"/>"
         )
        ("blog-static"
         :base-directory "~/org/codingOrg/files/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "~/orgPublish/coding/files/"
         :recursive t
         :publishing-function org-publish-attachment
         )
        ("blog" :components ("blog-notes" "blog-static"))

        ("test-publish"
         :base-directory "~/org/testOrg"
         :base-extension "org"
        :publishing-directory "~/orgPublish/testOrg/"
        :recursive t
        :publishing-function org-html-publish-to-html
        :headline-levels 4
        :auto-preamble t
        :section-numbers nil
        :author "victor72"
        :email "victoryman@126.com"
        :auto-sitemap t                  ; 自动生成 sitemap.org 文件
        :sitemap-filename "sitemap.org"  ; ... call it sitemap.org (it's the default)...
        :sitemap-title "Sitemap"         ; ... with title 'Sitemap'.
        :sitemap-sort-files anti-chronologically
        :sitemap-file-entry-format "%d %t"
      )
        ;;
        ))
(prodigy-define-service
  :name "Python app"
  :command "python"
  :args '("-m" "SimpleHTTPServer" "6001")
  :cwd "~/"
  :tags '(work)
  :stop-signal 'sigkill
  :kill-process-buffer-on-stop t)

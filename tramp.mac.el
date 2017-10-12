(require 'tramp)
(set-default 'tramp-auto-save-directory "~/tmp/")

(tramp-set-completion-function "ssh"
                               '((tramp-parse-sconfig "/etc/ssh_config")
                                 (tramp-parse-sconfig "~/.ssh/config")))

(set-default 'tramp-default-method "ssh")

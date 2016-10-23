(define-abbrev-table 'global-abbrev-table '(
    ;; math/unicode symbols
    ("8in" "∈")
    ("8nin" "∉")
    ("8inf" "∞")
    ("8luv" "♥")
    ("8smly" "☺")

    ;; email
    ("gm" "showgood21@gmail.com")

    ;; my own
    ("atm" "at the moment")
    ("stmt" "statement")
    ("sb" "somebody")
    ("sth" "something")
    ("8par" "parramatta")
    ("stc" "statistic")
    ("8as" "assignment")
    ("8unf" "unfortunately")
    ("8alt" "alternative")
    ("8ev" "everything")
    ("8in" "interesting")
    ("8mo" "morning")
    ("coz" "because")
    ("df" "difficulty")
    ("az" "always")
    ("ow" "otherwise")
    ("exr" "exercise")
    ("8me" "meditation")
    ("8pr" "probably")
    ("8gr" "guarantee")
    ("8al" "already")
    ("8pro" "property")
    ("8rl" "relative")
    ("8ab" "absolute")
    ("woo" "woolworths")
    ("citi" "citibank")
    ("8cr" "credit card repayment")
    ("elec" "electricity")

    ;; coding
    ("ustd" "using namespace std;")

    ;; computing tech
    ("wp" "Wikipedia")
    ("8ms" "Microsoft")
    ("8g" "Google")
    ("8msw" "Microsoft Windows")
    ("8win" "Windows")
    ("8ie" "Internet Explorer")

    ;; normal english words
    ("8alt" "alternative")
    ("8char" "character")
    ("8def" "definition")
    ("8bg" "background")
    ("8kb" "keyboard")
    ("8ex" "example")
    ("8kbd" "keybinding")
    ("8env" "environment")
    ("8var" "variable")
    ("8ev" "environment variable")
    ("8cp" "computer")

    ;; emacs regex
    ("8d" "\\([0-9]+?\\)")
    ("8str" "\\([^\"]+?\\)\"")

    ;; shell commands
    ("8im" "convert -quality 85% ")

    ("8f0" "find . -type f -size 0 -exec rm {} ';'")
    ))

;; stop asking whether to save newly added abbrev when quitting emacs
(setq save-abbrevs nil)

;; turn on abbrev mode globally
(setq-default abbrev-mode t)

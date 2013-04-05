;;; site-lisp configuration for SLIME

(add-to-list 'load-path "@SITELISP@")
(add-to-list 'load-path "@SITELISP@/contrib")
(autoload 'slime-highlight-edits-mode "slime-highlight-edits")

(require 'slime-autoloads)
(slime-setup '(slime-fancy slime-repl slime-asdf slime-banner
               slime-compiler-notes-tree slime-sprof))

;; this allows us not to require dev-lisp/hyperspec
;; (which is non-free) as a hard dependency
(setq common-lisp-hyperspec-root
      (if (file-exists-p "/usr/share/doc/hyperspec/HyperSpec")
          "file:///usr/share/doc/hyperspec/HyperSpec/"
        "http://www.lispworks.com/reference/HyperSpec/"))

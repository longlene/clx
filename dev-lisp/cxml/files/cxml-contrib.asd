(defpackage #:cxml-contrib-package (:use #:asdf #:common-lisp))
(in-package #:cxml-contrib-package)
(defsystem #:cxml-contrib
  :name "CXML-CONTRIB"
  :components ((:module :contrib
			:components ((:file "xhtmlgen"))))
  :depends-on (#:cxml))
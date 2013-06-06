;;; --------------------------------------------------------------------------
;;; CLFSWM - FullScreen Window Manager
;;;
;;; --------------------------------------------------------------------------
;;; Documentation: System loading functions
;;; --------------------------------------------------------------------------
;;;
;;; (C) 2005 Philippe Brochard <hocwp@free.fr>
;;;
;;; This program is free software; you can redistribute it and/or modify
;;; it under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 3 of the License, or
;;; (at your option) any later version.
;;;
;;; This program is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with this program; if not, write to the Free Software
;;; Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
;;;
;;; --------------------------------------------------------------------------
;;;
;;; Edit this file (or its copy) and load it with your lisp implementation.
;;; If you want, it can download ASDF and CLX for you. You'll need wget and
;;; git program.
;;;
;;; Here are command line reference:
;;;
;;; clisp -E iso-8859-1 load.lisp
;;; sbcl --load load.lisp
;;; cmucl -load load.lisp
;;; ccl -l load.lisp
;;; ecl -load load.lisp
;;;
;;; --------------------------------------------------------------------------

;;;------------------
;;; Customization part
;;;------------------
(defparameter *interactive* nil)

(defparameter *build-original-doc* t
  "Set to t to use original configuration or to nil to use your own configuration
from $XDG_CONFIG_HOME/clfswm/clfswmrc")


;;; Comment or uncomment the lines above to fit your needs.
(pushnew :clfswm-compile *features*)
;;(pushnew :clfswm-run *features*)
(pushnew :clfswm-build-image *features*)
;;(pushnew :clfswm-build-doc *features*)

(defparameter *binary-name* "clfswm")

;;;;; Uncomment the line below if you want to see all ignored X errors
;;(pushnew :xlib-debug *features*)

;;;;; Uncomment the line below if you want to see all event debug messages
;;(pushnew :event-debug *features*)



#+:CMU (setf ext:*gc-verbose* nil)

#+:SBCL
(require :sb-posix)

(load (compile-file "src/tools.lisp"))

(defun load-info (formatter &rest args)
  (format t "~&  ==> ~A~%" (apply #'format nil formatter args))
  (force-output))

(defun interactive-ask (formatter &rest args)
  (when *interactive*
    (y-or-n-p (apply #'format nil formatter args))))

;;;------------------
;;; XLib part 1
;;;------------------
#+(or :CMU :ECL)
(require :clx)


;;;------------------
;;; ASDF part
;;;------------------
;;;; Loading ASDF
(load-info "Requiring ASDF")

#+(or :SBCL :CMUCL :CCL :ECL)
(require :asdf)

#-ASDF
(when (probe-file  "/usr/share/common-lisp/source/asdf/build/asdf.lisp")
  (load "/usr/share/common-lisp/source/asdf/build/asdf.lisp"))

#-:ASDF
(progn (format t "No asdf found~%")
       (exit))

(format t "ASDF version: ~A~%" (asdf:asdf-version))

;;;------------------
;;; XLib part 2
;;;------------------
(load-info "Requiring CLX")

;;; Loading clisp dynamic module. This part needs clisp >= 2.50
;;#+(AND CLISP (not CLX))
;;(when (fboundp 'require)
;;  (require "clx.lisp"))
#-CLX
(asdf:load-system :clx)

;;;------------------
;;; CLFSWM loading
;;;------------------
#+:clfswm-compile
(progn
  (load-info "Compiling CLFSWM")
  (pushnew #p"./" asdf:*central-registry*)
  (require :clfswm))
  ;(asdf:oos 'asdf:load-op :clfswm))


;;;-------------------------
;;; Starting clfswm
;;;-------------------------
#+(or :clfswm-run :clfswm-build-doc :clfswm-build-image)
(in-package :clfswm)

#+(or :clfswm-run :clfswm-build-doc)
(progn
  (cl-user::load-info "Running CLFSWM")
  (ignore-errors
    (main :read-conf-file-p (not cl-user::*build-original-doc*))))


;;;-------------------------
;;; Building documentation
;;;-------------------------
#+:clfswm-build-doc
(progn
  (cl-user::load-info "Building documentation")
  (produce-all-docs))

;;;-----------------------
;;; Building image part
;;;-----------------------

;;; Uncomment the line below to set the contrib directory in the image
;; (setf *contrib-dir* "/usr/local/lib/clfswm/")

#+:clfswm-build-image
(progn
  (cl-user::load-info "Building CLFSWM executable image")
  (build-lisp-image "clfswm"))

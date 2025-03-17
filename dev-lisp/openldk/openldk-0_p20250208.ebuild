# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

EGIT_COMMIT="5cab5202df9314411b4c5b11cec684033380fbea"

DESCRIPTION="A Java JIT Compiler and Runtime in Common Lisp"
HOMEPAGE="https://github.com/atgreen/openldk"
SRC_URI="https://github.com/atgreen/openldk/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-annot
	dev-lisp/command-line-args
	dev-lisp/flexi-streams
	dev-lisp/zip
	dev-lisp/str
	dev-lisp/defclass-std
	dev-lisp/fast-io
	dev-lisp/bitio
	dev-lisp/pathname-utils
	dev-lisp/cl-store
	dev-lisp/trivial-backtrace
	dev-lisp/fset
	dev-lisp/bordeaux-threads
	dev-lisp/float-features
	dev-lisp/local-time
	dev-lisp/closer-mop
	dev-lisp/file-attributes
	dev-lisp/trivial-garbage
	dev-lisp/precise-time
	app-emacs/sly
"
BDEPEND=""

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}

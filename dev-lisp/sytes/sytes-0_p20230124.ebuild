# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="9a0624b853dbf872786c0b205a4806f576ee161c"

DESCRIPTION="A Common Lisp library for making simple websites quickly"
HOMEPAGE="https://github.com/mishoo/sytes"
SRC_URI="https://github.com/mishoo/sytes/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+sbcl"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/hunchentoot
	dev-lisp/anaphora
	dev-lisp/parse-number
	dev-lisp/cl-ppcre
	dev-lisp/cl-unicode
	dev-lisp/split-sequence
	dev-lisp/cl-fad
	dev-lisp/bordeaux-threads
	dev-lisp/trivial-utf8
	dev-lisp/closer-mop
	sbcl? ( dev-lisp/sbcl )
"
BDEPEND=""

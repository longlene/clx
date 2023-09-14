# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="8eef2d577d8266c11c6bba4129bda2de7da20eee"

DESCRIPTION="A base library for scientific computation in Lisp"
HOMEPAGE="https://github.com/matlisp/matlisp"
SRC_URI="https://github.com/matlisp/matlisp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/iterate
	dev-lisp/trivia
	dev-lisp/named-readtables
	dev-lisp/lambda-reader
	dev-lisp/parse-float
	dev-lisp/ieee-floats
	dev-lisp/cl-yacc
	dev-lisp/trivial-garbage
	dev-lisp/trivial-types
	dev-lisp/closer-mop
	dev-lisp/external-program
	dev-lisp/bordeaux-threads
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	eapply_user
	if ! use test ; then
		rm -r t
		sed -e '/defsystem\ :matlisp-tests/,$d' \
			-e 's|#:fiveam||' \
			-i ${PN}.asd
	fi
}

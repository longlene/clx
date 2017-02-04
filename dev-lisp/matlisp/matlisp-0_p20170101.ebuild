# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="846294e549caa08548dd85edb10b0d833c05b675"

DESCRIPTION="A base library for scientific computation in Lisp"
HOMEPAGE="https://github.com/matlisp/matlisp"
SRC_URI="https://github.com/matlisp/matlisp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/iterate
	dev-lisp/trivia
	dev-lisp/named-readtables
	dev-lisp/lambda-reader
	dev-lisp/cl-yacc
	dev-lisp/trivial-garbage
	dev-lisp/trivial-types
	dev-lisp/closer-mop
	dev-lisp/external-program
	dev-lisp/bordeaux-threads
	dev-lisp/fiveam
"

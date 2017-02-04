# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="7c8fd14df6c04517aa7d1013ff074ce903aca2c2"

DESCRIPTION="Utilities beyond Alexandria"
HOMEPAGE="https://github.com/TBRSS/serapeum"
SRC_URI="https://github.com/TBRSS/serapeum/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/trivia
	dev-lisp/uiop
	dev-lisp/split-sequence
	dev-lisp/string-case
	dev-lisp/parse-number
	dev-lisp/trivial-garbage
	dev-lisp/bordeaux-threads
	dev-lisp/named-readtables
	dev-lisp/fare-quasiquote
	dev-lisp/parse-declarations
	dev-lisp/introspect-environment
	dev-lisp/global-vars
	dev-lisp/cl-algebraic-data-type
	dev-lisp/fiveam
"

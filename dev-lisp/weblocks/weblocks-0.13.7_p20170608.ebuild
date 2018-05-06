# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="fe96152458c8eb54d74751b3201db42dafe1708b"

DESCRIPTION="Weblocks is a continuations-based web framework written in Common Lisp."
HOMEPAGE="http://weblocks-framework.info/"
SRC_URI="https://github.com/skypher/weblocks/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

RDEPEND="
	dev-lisp/closer-mop
	dev-lisp/hunchentoot
	dev-lisp/puri
	dev-lisp/cl-json
	dev-lisp/cl-who
	dev-lisp/parenscript
	dev-lisp/cl-fad
	dev-lisp/optima
	dev-lisp/cl-cont
	dev-lisp/metatilities
	dev-lisp/cl-ppcre
	dev-lisp/anaphora
	dev-lisp/f-underscore
	dev-lisp/bordeaux-threads
	dev-lisp/salza2
	dev-lisp/html-template
	dev-lisp/trivial-timeout
	dev-lisp/trivial-backtrace
	dev-lisp/parse-number
	dev-lisp/pretty-function
	dev-lisp/babel
	dev-lisp/split-sequence
	dev-lisp/ironclad
	test? ( dev-lisp/lift )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd test
}

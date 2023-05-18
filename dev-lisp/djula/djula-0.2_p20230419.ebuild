# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="cd2c9e33d4ee265597f4cc9eab2f23bc0640f2b5"

DESCRIPTION="Common Lisp port of the Django templating language"
HOMEPAGE="http://mmontone.github.io/djula"
SRC_URI="https://github.com/mmontone/djula/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="example test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/access
	dev-lisp/alexandria
	dev-lisp/anaphora
	dev-lisp/babel
	dev-lisp/cl-ppcre
	dev-lisp/cl-fad
	dev-lisp/split-sequence
	dev-lisp/local-time
	dev-lisp/closer-mop
	dev-lisp/trivial-backtrace
	dev-lisp/cl-slice
	dev-lisp/cl-locale
	dev-lisp/gettext
	dev-lisp/parser-combinators
	dev-lisp/iterate
	example? ( dev-lisp/hunchentoot )
"

src_prepare() {
	default
	use example || rm -r ${PN}-demo.asd demo
	use test || rm -r ${PN}-test.asd test
}

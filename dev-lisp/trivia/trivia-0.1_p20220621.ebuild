# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="6ead14c6140d3bc9dbddcbec80195358a68c518e"

DESCRIPTION="Pattern Matcher Compatible with Optima"
HOMEPAGE="https://github.com/guicho271828/trivia"
SRC_URI="https://github.com/guicho271828/trivia/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/lisp-namespace
	dev-lisp/closer-mop
	dev-lisp/alexandria
	dev-lisp/fare-quasiquote
	dev-lisp/trivial-cltl2
	dev-lisp/type-i
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	default
	use test || rm -rf test *.test.asd bench ${PN}.benchmark.asd
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.org
}

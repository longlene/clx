# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="f01b7990b611cff449cccb09b563aedd2f036df6"

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
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	eapply_user
	use test || rm -rf test *.test.asd bench ${PN}.benchmark.asd
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.org
}

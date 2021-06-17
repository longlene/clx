# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="e2517923fb33d5395d176eb4c54c610a1272ff9a"

DESCRIPTION="Super Duper Doopa Booka Lispy Gnuplot library"
HOMEPAGE="https://github.com/guicho271828/eazy-gnuplot/"
SRC_URI="https://github.com/guicho271828/eazy-gnuplot/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/iterate
	dev-lisp/trivia
	dev-lisp/alexandria
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	eapply_user
	use test || rm -rf ${P}.test.asd t
}


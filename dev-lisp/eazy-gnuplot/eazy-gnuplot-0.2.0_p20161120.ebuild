# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="04bdee453f6a9bfc3f30efe4ad170046b2d76f42"

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
	dev-lisp/uiop
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	use test || rm -rf ${P}.test.asd t
}


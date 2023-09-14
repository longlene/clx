# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="17205d162ae73bf61cb663573f98d92ced3669f2"

DESCRIPTION="Common Interface to Boolean Satisfiability Solvers from Common Lisp"
HOMEPAGE="https://github.com/guicho271828/cl-sat"
SRC_URI="https://github.com/guicho271828/cl-sat/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivia
	dev-lisp/alexandria
	dev-lisp/iterate
	test? ( dev-lisp/fiveam )
"
BDEPEND=""

src_prepare() {
	default
	rm asd-generator-data.asd
	use test || rm -r ${PN}.test.asd t
}

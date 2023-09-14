# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="0ff1d97a3fbcb89264f6a2af6ce62b73e7b421f4"

DESCRIPTION="User-defined constant folding facility"
HOMEPAGE="https://github.com/numcl/constantfold"
SRC_URI="https://github.com/numcl/constantfold/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivia
	dev-lisp/alexandria
	dev-lisp/iterate
	dev-lisp/lisp-namespace
	dev-lisp/libfixposix
	sci-mathematics/minisat
	test? ( dev-lisp/fiveam )
"
BDEPEND=""

src_prepare() {
	default
	rm asd-generator-data.asd
	use test || rm -r ${PN}.test.asd t
}

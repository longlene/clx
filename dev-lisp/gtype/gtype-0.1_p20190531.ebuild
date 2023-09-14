# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="42275e3606242ae91e9c8dfa30c18ced50a35b66"

DESCRIPTION="C++/Julia-like parametric types in CL"
HOMEPAGE="https://github.com/numcl/gtype"
SRC_URI="https://github.com/numcl/gtype/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivialib_type-unify
	dev-lisp/trivial-cltl2
	dev-lisp/trivia
	dev-lisp/alexandria
	dev-lisp/iterate
	dev-lisp/type-r
	test? ( dev-lisp/fiveam )
"
BDEPEND=""

src_prepare() {
	default
	rm asd-generator-data.asd
	use test || rm -r ${PN}.test.asd t
}

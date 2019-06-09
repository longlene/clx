# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="62492ebf04db567dcf435ae84c50b7b8202ecf99"

DESCRIPTION="unifies a polimorphic type specifier with type variables"
HOMEPAGE="https://github.com/guicho271828/trivialib.type-unify"
SRC_URI="https://github.com/guicho271828/trivialib.type-unify/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/trivia
	dev-lisp/introspect-environment
	dev-lisp/type-r
	test? ( dev-lisp/fiveam )
"
BDEPEND=""

src_prepare() {
	default
	use test || rm -r trivialib.type-unify.test.asd t
}
	

# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d34440ab4ebf5a46a58deccb35950b15670e3667"

DESCRIPTION="Type Inference Utility on Fundamentally 1-arg Predicates"
HOMEPAGE="https://github.com/guicho271828/type-i"
SRC_URI="https://github.com/guicho271828/type-i/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/introspect-environment
	dev-lisp/alexandria
	dev-lisp/trivia
	dev-lisp/lisp-namespace
	test? ( dev-lisp/fiveam )
"
BDEPEND=""

src_prepare() {
	default
	use test || rm -r ${PN}.test.asd t
}

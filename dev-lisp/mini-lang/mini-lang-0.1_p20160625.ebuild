# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="2872c0e5fbcc6048ec43b9b3a41ef201e1d7a633"

DESCRIPTION="Efficient and expressive vector math library with an embedded language on Common Lisp"
HOMEPAGE="https://github.com/takagi/mini-lang"
SRC_URI="https://github.com/takagi/mini-lang/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="example test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-tuples
	dev-lisp/cl-pattern
	dev-lisp/cl-unification
	test? ( dev-lisp/cl-test-more )
	example? ( dev-lisp/iimago )
"

src_prepare() {
	eapply_user
	use example || rm -rf ${PN}-examples.asd examples
	use test || rm -rf ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}

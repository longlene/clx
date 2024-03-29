# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="76131f1767da8280ce8b9079bddf8073507cc78a"

DESCRIPTION="C language syntax in Common Lisp"
HOMEPAGE="https://github.com/y2q-actionman/with-c-syntax"
SRC_URI="https://github.com/y2q-actionman/with-c-syntax/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="WTFPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cl-yacc
	dev-lisp/named-readtables
	dev-lisp/osicat
	dev-lisp/float-features
	dev-lisp/floating-point-contractions
	test? ( dev-lisp/1am )
"
BDEPEND=""

src_prepare() {
	default
	use test || rm -r ${PN}-test.asd test
}

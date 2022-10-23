# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d6d7c9aa985b22f747f63b0cf4a941cada6c66c1"

DESCRIPTION="The Common Foreign Function Interface (CFFI)"
HOMEPAGE="http://common-lisp.net/project/cffi/"
SRC_URI="https://github.com/cffi/cffi/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE="doc example test"

DEPEND="doc? ( dev-lisp/sbcl virtual/texi2dvi )"
RDEPEND="
	dev-lisp/alexandria
	dev-lisp/babel
	dev-lisp/trivial-features
	dev-lisp/cl-ppcre
	dev-lisp/cl-json
	test? ( dev-lisp/bordeaux-threads )
"

src_prepare() {
	default
	use test || rm -r ${PN}-tests.asd tests
	use example || rm -r ${PN}-examples.asd examples
	rm -r ${PN}-uffi-compat.asd uffi-compat scripts
}

src_compile() {
	use doc && VARTEXFONTS="${T}"/fonts emake -C doc manual spec
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all grovel/common.h

	dodoc README.md TODO doc/*.txt
	if use doc; then
		doinfo doc/*.info
		rm doc/{spec,manual}/cffi*
		insinto /usr/share/doc/${PF}/html
		doins -r doc/{spec,manual}
	fi
}

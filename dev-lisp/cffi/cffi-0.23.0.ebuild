# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3

DESCRIPTION="The Common Foreign Function Interface (CFFI)"
HOMEPAGE="http://common-lisp.net/project/cffi/"
SRC_URI="https://github.com/cffi/cffi/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE="doc example test"

DEPEND="doc? ( dev-lisp/sbcl virtual/texi2dvi )"
RDEPEND="
	dev-lisp/alexandria
	dev-lisp/babel
	dev-lisp/trivial-features
	test? ( dev-lisp/bordeaux-threads )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-tests.asd tests
	use example || rm -r ${PN}-examples.asd examples
	rm -r scripts uffi-compat/uffi.asd
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

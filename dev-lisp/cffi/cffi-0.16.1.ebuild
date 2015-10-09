# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3

DESCRIPTION="The Common Foreign Function Interface (CFFI)"
HOMEPAGE="http://common-lisp.net/project/cffi/"
SRC_URI="https://github.com/cffi/cffi/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
#KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~arm"
IUSE="doc"

DEPEND="doc? ( dev-lisp/sbcl virtual/texi2dvi )"
RDEPEND="
dev-lisp/uiop
dev-lisp/alexandria
dev-lisp/babel
dev-lisp/trivial-features
"
src_compile() {
	if use doc ; then
		VARTEXFONTS="${T}"/fonts \
			make -C doc manual spec || die "Cannot build docs"
	fi
}

src_install() {
	common-lisp-install-sources examples/ src/ uffi-compat/
	common-lisp-install-sources -t all grovel/ tests/
	common-lisp-install-asdf
	dodoc README.md TODO doc/*.txt
	if use doc; then
		doinfo doc/*.info
		rm doc/{spec,manual}/cffi*
		insinto /usr/share/doc/${PF}/html
		doins -r doc/{spec,manual}
	fi
}

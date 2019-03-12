# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3

DESCRIPTION="A portable Common Lisp networking library for undemanding Internet clients"
HOMEPAGE="http://www.cliki.net/trivial-sockets"
SRC_URI="https://github.com/usocket/trivial-sockets/archive/v${PV}.tar.gz -> ${P}.tar.bz2"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE="doc"

DEPEND="doc? ( virtual/texi2dvi )"
RDEPEND="!dev-lisp/cl-${PN}"

src_compile() {
	if use doc ; then
		VARTEXFONTS="${T}"/fonts \
			texi2pdf ${PN}.texi -o ${PN}.pdf || die "Cannot build PDF docs"
	fi
}

src_install() {
	common-lisp-install-sources *.lisp
	common-lisp-install-asdf
	dodoc README
	use doc && dodoc ${PN}.pdf
}

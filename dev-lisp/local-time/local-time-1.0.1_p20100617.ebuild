# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit common-lisp-3

DESCRIPTION="LOCAL-TIME is a development library for manipulating date and time information."
HOMEPAGE="http://common-lisp.net/project/local-time/"
SRC_URI="http://common-lisp.net/~sionescu/files/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE="doc postgres"

DEPEND="sys-apps/texinfo
		doc? ( virtual/texi2dvi )"
RDEPEND="sys-libs/timezone-data
		dev-lisp/cl-fad"
PDEPEND="postgres? ( dev-lisp/postmodern )"

src_prepare() {
	epatch "${FILESDIR}"/${PV}-gentoo-use-system-zonedata.patch
}

src_compile() {
	cd doc
	makeinfo ${PN}.texinfo -o ${PN}.info || die "Cannot compile info docs"
	if use doc ; then
		VARTEXFONTS="${T}"/fonts \
			texi2pdf ${PN}.texinfo -o ${PN}.pdf || die "Cannot build PDF docs"
	fi
}

src_install() {
	common-lisp-install-sources src/local-time.lisp test
	common-lisp-install-asdf local-time.asd local-time.test.asd
	if use postgres; then
		common-lisp-install-sources src/integration/cl-postgres.lisp
		common-lisp-install-asdf cl-postgres+local-time.asd
	fi
	dodoc CREDITS README TODO
	doinfo doc/${PN}.info
	use doc && dodoc doc/${PN}.pdf
}

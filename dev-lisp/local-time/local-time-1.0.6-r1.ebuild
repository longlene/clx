# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3

DESCRIPTION="LOCAL-TIME is a development library for manipulating date and time information."
HOMEPAGE="http://common-lisp.net/project/local-time/"
SRC_URI="https://github.com/dlowe-net/${PN}/archive/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE="doc postgres"

DEPEND="sys-apps/texinfo
		doc? ( virtual/texi2dvi )"
RDEPEND="sys-libs/timezone-data
		dev-lisp/cl-fad"
PDEPEND="postgres? ( dev-lisp/postmodern )"

install_postgresql_files() {
	common-lisp-install-sources src/integration/cl-postgres.lisp
	common-lisp-install-asdf cl-postgres+local-time.asd
}

src_prepare() {
	default
	eapply "${FILESDIR}"/${P}-use-system-zonedata.patch
}

src_compile() {
	if use doc ; then
		cd doc  || die
		VARTEXFONTS="${T}"/fonts \
			texi2pdf ${PN}.texinfo -o ${PN}.pdf || die
	fi
}

src_install() {
	common-lisp-install-sources src/*.lisp
	common-lisp-install-asdf local-time.asd

	use postgres && install_postgresql_files
	dodoc CREDITS README TODO
	use doc && dodoc doc/${PN}.pdf
}

# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit webapp versionator eutils

DESCRIPTION="a fast and concise JavaScript Library"
HOMEPAGE="http://jquery.com/"
SRC_URI="http://code.jquery.com/${P}.js http://code.jquery.com/${P}.min.js"

LICENSE="|| ( MIT GPL-2 )"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_unpack() {
	cp "${DISTDIR}/${P}.js" "${S}/"
	cp "${DISTDIR}/${P}.min.js" "${S}/"
	ln -s "${P}.js" "${PN}.js"
	ln -s "${P}.min.js" "${PN}.min.js"
}

src_install() {
	webapp_src_preinst
	webapp_src_install
	insinto "${MY_HTDOCSDIR}"
	doins "${P}.js" "${P}.min.js" "${PN}.js" "${PN}.min.js"
}

pkg_setup() {
	webapp_pkg_setup
}

pkg_postinst() {
	webapp_pkg_postinst
}

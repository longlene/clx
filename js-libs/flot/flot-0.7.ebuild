# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit webapp versionator eutils

DESCRIPTION="a pure Javascript plotting library for jQuery"
HOMEPAGE="http://code.google.com/p/${PN}/"
SRC_URI="http://${PN}.googlecode.com/files/${P}.tar.gz"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="examples minimal"

DEPEND="js-libs/jquery"
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_unpack() {
	cp "${DISTDIR}/jquery.flot.js" "${S}/"
	cp "${DISTDIR}/jquery.flot.*.js" "${S}/"
	if [ use examples ] ; then
		cp "${DISTDIR}/examples/*" "${S}/examples/"
	fi
}

src_install() {
	webapp_src_preinst
	webapp_src_install
	insinto "${MY_HTDOCSDIR}"
	doins "${P}.js" "${P}.min.js"
}

pkg_setup() {
	webapp_pkg_setup
}

pkg_postinst() {
	webapp_pkg_postinst
}

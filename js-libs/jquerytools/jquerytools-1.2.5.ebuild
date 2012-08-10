# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit webapp versionator eutils

MY_P="jquery.tools"

DESCRIPTION="The missing UI library for the Web"
HOMEPAGE="http://flowplayer.org/tools/"
SRC_URI="http://cdn.jquerytools.org/${PV}/all/${MY_P}.min.js"

LICENSE="public-domain"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="js-libs/jquery"
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_unpack() {
	cp "${DISTDIR}/${MY_P}.min.js" "${S}/"
}

src_install() {
	webapp_src_preinst
	webapp_src_install
	insinto "${MY_HTDOCSDIR}"
	doins "${MY_P}.min.js"
}

pkg_setup() {
	webapp_pkg_setup
}

pkg_postinst() {
	webapp_pkg_postinst
}

# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit webapp versionator eutils

MY_P="ext-${PV}"

DESCRIPTION="JavaScript framework for rich apps in every browser"
HOMEPAGE="http://www.sencha.com/products/extjs/"
SRC_URI="http://extjs.cachefly.net/${MY_P}-gpl.zip"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
IUSE="examples debug"

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}"

src_unpack() {
	unpack "${MY_P}-gpl.zip"
}

src_install() {
	webapp_src_preinst
	webapp_src_install
	insinto "${MY_HTDOCSDIR}"
	doins "ext.js" "ext-all.js"
	doins -r "resources/"
	use examples && doins -r "examples/"
}

pkg_setup() {
	webapp_pkg_setup
}

pkg_postinst() {
	webapp_pkg_postinst
}

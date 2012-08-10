# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit webapp versionator eutils

MY_P="jquery-ui-${PV}"

DESCRIPTION="An UI library for jQuery"
HOMEPAGE="http://jqueryui.com/"
SRC_URI="http://jqueryui.com/download/${MY_P}.custom.zip"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_unpack() {
	unpack "${MY_P}.custom.zip"
	ln -s "${MY_P}.custom.min.js" "js/${PN}.min.js"
	ln -s "${MY_P}.custom.css" "css/smoothness/${PN}.css"
}

src_install() {
	webapp_src_preinst
	webapp_src_install
	insinto "${MY_HTDOCSDIR}"
	doins "js/${MY_P}.custom.min.js" "js/${PN}.min.js"
	doins "css/smoothness/${MY_P}.custom.css" "css/smoothness/${PN}.css"
}

pkg_setup() {
	webapp_pkg_setup
}

pkg_postinst() {
	webapp_pkg_postinst
}

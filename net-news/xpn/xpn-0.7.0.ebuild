# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit python eutils multilib

DESCRIPTION="A graphical newsreader written in Python"
HOMEPAGE="http://xpn.altervista.org/index-en.html"
SRC_URI="http://xpn.altervista.org/codice/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="linguas_de linguas_fr linguas_it"

DEPEND=""
RDEPEND=">=dev-lang/python-2.4
		 >=dev-python/pygtk-2.8
		 >=x11-libs/gtk+-2.8"


src_install() {

	python_version
	exeinto "/usr/$(get_libdir)/python${PYVER}/site-packages/${PN}"
	doexe "${PN}.py"

	insinto "/usr/$(get_libdir)/python${PYVER}/site-packages/${PN}/lang/"
	use linguas_de && doins -r lang/de
	use linguas_fr && doins -r lang/fr
	use linguas_it && doins -r lang/it

	insinto "/usr/$(get_libdir)/python${PYVER}/site-packages/${PN}/pixmaps"
	doins pixmaps/*

	insinto "/usr/$(get_libdir)/python${PYVER}/site-packages/${PN}/xpn_src"
	doins xpn_src/*

	newicon pixmaps/xpn-icon.png "${PN}.png"
	make_desktop_entry "${PN}" "${PN}"

	dodoc AUTHORS ChangeLog README
	dohtml xpn.html

	make_wrapper "${PN}" "./${PN}.py" "/usr/$(get_libdir)/python${PYVER}/site-packages/${PN}"
}

pkg_postinst() {
	python_version
	python_mod_optimize "${ROOT}usr/$(get_libdir)/python${PYVER}/site-packages/${PN}"
}

pkg_postrm() {
	python_version
	python_mod_cleanup "${ROOT}usr/$(get_libdir)/python${PYVER}/site-packages/${PN}"
}


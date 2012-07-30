# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils python

IUSE=""

DESCRIPTION="Live user interface builder for controlling parameters via OSC."
HOMEPAGE="http://khagan.berlios.de/"
SRC_URI="http://download.berlios.de/khagan/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"

DEPEND="dev-python/pyxml
	>=dev-python/pygtk-2.4
	>=media-libs/pyphat-0.1"

src_install() {
	distutils_src_install
	dodoc AUTHORS README
}

pkg_postrm() {
	python_mod_cleanup
}
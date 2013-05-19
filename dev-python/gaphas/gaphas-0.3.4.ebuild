# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

NEED_PYTHON=2.4

inherit distutils

DESCRIPTION="GTK+ based diagramming widget written in Python."
HOMEPAGE="http://pypi.python.org/pypi/gaphas/"
SRC_URI="http://pypi.python.org/packages/source/g/${PN}/${P}.tar.gz"
RESTRICT="nomirror"
LICENSE="GPL-2"

SLOT="0"
IUSE=""
KEYWORDS="~amd64 ~x86"

DEPEND=">=x11-libs/gtk+-2.8
	>=dev-python/pygtk-2.8"
	
# Additional docs not covered by distutils
DOCS="AUTHORS"

PYTHON_MODNAME="${PN}"

src_install() {
	distutils_src_install
}

src_postinst() {
	distutils_pkg_postinst
}


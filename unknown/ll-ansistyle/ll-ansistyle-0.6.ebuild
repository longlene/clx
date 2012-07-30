# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="Wraps an output stream and adds color capability via ANSI escape sequences."
HOMEPAGE="http://www.livinglogic.de/Python/ansistyle/"
SRC_URI="http://ftp.livinglogic.de/ansistyle/${P}.tar.bz2"

LICENSE="CNRI"
IUSE=""
KEYWORDS="~x86"
SLOT="0"

DEPEND="
	>=dev-lang/python-2.4
	dev-python/ll-core
"

PYTHON_MODNAME="ll"

src_install() {
	DOCS="README PKG-INFO NEWS"
	distutils_src_install
}

# End

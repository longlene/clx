# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="Various utilities used by the other LivingLogic packages."
HOMEPAGE="http://www.livinglogic.de/Python/core"
SRC_URI="http://ftp.livinglogic.de/core/${P}.tar.bz2"

LICENSE="CNRI"
IUSE=""
KEYWORDS="~x86"
SLOT="0"

DEPEND=">=dev-lang/python-2.4"

PYTHON_MODNAME="ll"

src_install() {
	DOCS="README PKG-INFO"
	distutils_src_install
}

# End

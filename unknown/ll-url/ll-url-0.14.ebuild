# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="Classes for parsing and constructing RFC 2396 compliant URLs."
HOMEPAGE="http://www.livinglogic.de/Python/url/"
SRC_URI="http://ftp.livinglogic.de/url/${P}.tar.bz2"

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
	DOCS="README PKG-INFO HOWTO NEWS"
	distutils_src_install

	# Post-installation test code
	insinto /usr/lib/${PF}
	doins -r test/
}

# End

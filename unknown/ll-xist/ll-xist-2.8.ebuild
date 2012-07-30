# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="Object Oriented XSL - Extensible HTML/XML generator, pythonesque DOM parser, ..."
HOMEPAGE="http://www.livinglogic.de/Python/xist/"
SRC_URI="http://ftp.livinglogic.de/xist/${P}.tar.bz2"

LICENSE="CNRI"
IUSE=""
KEYWORDS="~x86"
SLOT="0"

DEPEND="
	>=dev-lang/python-2.4
	>=dev-python/pyxml-0.8.4
	>=dev-python/ll-url-0.11.4
	dev-python/ll-ansistyle
	dev-python/imaging
	dev-libs/libxml2
	www-client/w3m
"

PYTHON_MODNAME="ll"

src_install() {
	DOCS="CREDITS EXAMPLES HOWTO LICENSE MIGRATION NEWS PKG-INFO README TODO"
	distutils_src_install

	# Docs & examples
	insinto /usr/share/doc/${PF}
	doins -r demos

	# Post-installation test code
	insinto /usr/lib/${PF}
	doins -r test/
	doins -r px/
}

# End

# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="Simplifies running Python stuff as cron jobs."
HOMEPAGE="http://www.livinglogic.de/Python/sisyphus/"
SRC_URI="http://ftp.livinglogic.de/sisyphus/${P}.tar.bz2"

LICENSE="CNRI"
IUSE=""
KEYWORDS="~x86"
SLOT="0"

DEPEND="
	>=dev-lang/python-2.4
	dev-python/ll-core
	dev-python/ll-url
"

PYTHON_MODNAME="ll"

src_install() {
	DOCS="README PKG-INFO NEWS"
	distutils_src_install

	# Post-installation test code
	insinto /usr/share/doc/${PF}
	doins -r examples/
}

# End

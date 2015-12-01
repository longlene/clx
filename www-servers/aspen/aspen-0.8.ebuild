# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit bash-completion distutils

DESCRIPTION="A Python web server"
HOMEPAGE="http://www.zetadev.com/software/${PN}/"
SRC_URI="http://www.zetadev.com/software/${PN}/${PV}/dist/${P}.tbz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="bash-completion doc"

DEPEND=""
RDEPEND=""

DOCS="doc/CONTRIBUTORS doc/HISTORY"

src_install() {
	distutils_src_install

	if use doc; then
		newdoc "doc/${P}.pdf" documentation.pdf || die
		dohtml -r doc/html/* || die
	fi

	if use bash-completion; then
		dobashcompletion "etc/${PN}_bash_completion"
	fi
}

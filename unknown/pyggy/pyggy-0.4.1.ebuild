# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="Lexer and GLR parser generator"
HOMEPAGE="http://www.lava.net/~newsham/pyggy"
SRC_URI="${HOMEPAGE}/${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~ppc ~x86"
IUSE="doc examples"

DEPEND=""
RDEPEND=""


src_install () {
	distutils_src_install

	use doc && dohtml -r doc/html/*

	if use examples ; then
		insinto /usr/share/doc/${P}/examples
		doins   examples/*.py*
		insinto /usr/share/doc/${P}/examples/ansic
		doins   examples/ansic/*.py*
	fi
}


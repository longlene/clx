# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils distutils

DESCRIPTION="A python PostgreSQL introspective ORM"
HOMEPAGE="www.dbmother.org"
SRC_URI="www.dbmother.org/download/${P}.tgz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=">=dev-python/psycopg-2.0"
RDEPEND=""

DOCS="AUTHORS CHANGELOG INSTALL LICENSE README TODO"

src_unpack() {
	unpack ${A}
	cd ${S}
}

src_install() {
	distutils_src_install

	insinto /usr/share/doc/${PF}/examples
	doins examples/*
	insinto /usr/share/doc/${PF}/doc
	doins doc/*
}




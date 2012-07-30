# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit webapp

DESCRIPTION="Web-based RSS/RDF/ATOM feed aggregator"
HOMEPAGE="http://gregarius.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="~x86"
IUSE="mysql sqlite"

DEPEND="
	mysql?  ( dev-db/mysql )
	sqlite? ( dev-db/sqlite )
"

S=${WORKDIR}/${PN}

src_install() {
	webapp_src_preinst

	for file in COPYING INSTALL; do
		dodoc ${file}
		rm -f ${file}
	done

	rm -f .DS_Store

	cp -R . ${D}/${MY_HTDOCSDIR}

	webapp_src_install
}

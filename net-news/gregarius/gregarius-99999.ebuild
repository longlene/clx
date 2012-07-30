# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

ESVN_REPO_URI="http://svn.gregarius.net/svn/trunk/gregarius"

inherit webapp subversion

DESCRIPTION="Web-based RSS/RDF/ATOM feed aggregator"
HOMEPAGE="http://gregarius.net/"
SRC_URI=""

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

	cp -R . ${D}/${MY_HTDOCSDIR}

	webapp_src_install
}

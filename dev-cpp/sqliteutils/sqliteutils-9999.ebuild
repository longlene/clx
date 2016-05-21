# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-2

DESCRIPTION="A lightweight C++14 utility library for sqlite"
HOMEPAGE="https://github.com/janezz55/sqliteutils"
SRC_URI=""

EGIT_REPO_URI="https://github.com/janezz55/sqliteutils.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-db/sqlite
"

src_install() {
	insinto /usr/include
	doins sqliteutils.h
	dodoc README.md
}

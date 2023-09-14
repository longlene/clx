# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="4969ef56de66fd85bb088486836073302b997ebd"

DESCRIPTION="C++ SQLite wrapper library"
HOMEPAGE="https://github.com/yhirose/cpp-sqlitelib"
SRC_URI="https://github.com/yhirose/cpp-sqlitelib/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-db/sqlite:3
"

src_install() {
	insinto /usr/include
	doins sqlitelib.h
	dodoc README.md
}

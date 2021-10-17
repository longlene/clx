# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit git-r3

DESCRIPTION="libzdb c++ 11 wrapper"
HOMEPAGE="https://github.com/abc100m/libzdbcpp"
SRC_URI=""

EGIT_REPO_URI="https://github.com/abc100m/libzdbcpp.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="dev-db/libzdb"
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins src/zdbcpp.h
	dodoc README.md
}

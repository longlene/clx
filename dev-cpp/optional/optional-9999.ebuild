# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit git-r3

DESCRIPTION="Option type implementation in C++11"
HOMEPAGE="https://github.com/oktal/optional"
SRC_URI=""

EGIT_REPO_URI="https://github.com/oktal/optional.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins optional.h
	dodoc README.md
}

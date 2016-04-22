# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-2

DESCRIPTION="A small ANSI C GUI toolkit"
HOMEPAGE="https://github.com/vurtun/nuklear"
SRC_URI=""

EGIT_REPO_URI="https://github.com/vurtun/nuklear.git"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins nuklear.h
	dodoc README.md
}

# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit vcs-snapshot

EGIT_COMMIT="ef2dcd3b779647e0140bb78863cb8439774e277b"

DESCRIPTION="A small ANSI C GUI toolkit"
HOMEPAGE="https://github.com/vurtun/nuklear"
SRC_URI="https://github.com/vurtun/nuklear/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins nuklear.h
	dodoc Readme.md
}

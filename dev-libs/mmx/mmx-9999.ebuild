# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-2

DESCRIPTION="single header libraries for C/C++"
HOMEPAGE="https://github.com/vurtun/mmx"
SRC_URI=""

EGIT_REPO_URI="https://github.com/vurtun/mmx.git"

LICENSE="zlib"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins *.h
	dodoc Readme.md
}

# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-2

DESCRIPTION="simple C Compiler"
HOMEPAGE="http://git.suckless.org/scc/tree/"
SRC_URI=""

EGIT_REPO_URI="git://git.suckless.org/scc"

LICENSE="MIT"
SLOT="0"
#KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i '/cc1/ s#$# cc2#' Makefile
}

src_install() {
	dobin scc cc1/cc1 cc2/cc2
	dodoc README
}

# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

DESCRIPTION="Web server for Linux written in amd64 assembly"
HOMEPAGE="https://github.com/nemasu/asmttpd"
SRC_URI=""

EGIT_REPO_URI="https://github.com/nemasu/asmttpd.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
dev-lang/yasm
"
RDEPEND="${DEPEND}"

src_install() {
	dobin asmttpd
	dodco README.md
}

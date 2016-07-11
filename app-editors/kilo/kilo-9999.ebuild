# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3

DESCRIPTION="A text editor in less than 1000 LOC with syntax highlight and search"
HOMEPAGE="https://github.com/antirez/kilo"
SRC_URI=""

EGIT_REPO_URI="https://github.com/antirez/kilo.git"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin kilo
	dodoc README.md
}

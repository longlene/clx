# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit git-r3

DESCRIPTION="Luna programming language"
HOMEPAGE="https://github.com/tj/luna"
#SRC_URI=""

EGIT_REPO_URI="https://github.com/tj/luna.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin luna
	dodoc Readme.md
}

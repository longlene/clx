# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit git-r3

DESCRIPTION="goroutine extension for c++"
HOMEPAGE="https://github.com/ipkn/goplus"
SRC_URI=""

EGIT_REPO_URI="https://github.com/ipkn/goplus.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-libs/boost[context]
"

src_install() {
	insinto /usr/include
	doins include/{channel,goplus,goroutine,scheduler}.h
	dodoc README.md
}

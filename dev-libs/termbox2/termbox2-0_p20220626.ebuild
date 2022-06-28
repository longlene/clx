# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="bac17e4f86f76940f282a591e0ced0ba4db329d8"

DESCRIPTION="suckless terminal rendering library"
HOMEPAGE="https://github.com/termbox/termbox2"
SRC_URI="https://github.com/termbox/termbox2/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	:
}

src_install() {
	insinto /usr/include
	doins termbox.h
	dodoc README.md
}

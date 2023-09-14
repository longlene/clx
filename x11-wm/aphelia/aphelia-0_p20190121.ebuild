# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="0ff76be2fd85831ede9b1bd04e1ccb6ec6216efb"

DESCRIPTION="A light, single-file, minimalist window manager for X11"
HOMEPAGE="https://github.com/vardy/aphelia"
SRC_URI="https://github.com/vardy/aphelia/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -e '/mkdir/d' \
		-e '/cp/d' \
		-i Makefile
}

src_install() {
	dobin alphelia
	dodoc README.md
}

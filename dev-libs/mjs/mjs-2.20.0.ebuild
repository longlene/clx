# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit flag-o-matic

DESCRIPTION="Embedded JavaScript engine for C/C++"
HOMEPAGE="https://github.com/cesanta/mjs"
SRC_URI="https://github.com/cesanta/mjs/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -i 's#$(DOCKER_CLANG) clang#$(DOCKER_CLANG)#' mjs/Makefile
}

src_compile() {
	DOCKER_GCC=$(tc-getCC) DOCKER_CLANG=$(tc-getCC) emake -C mjs
}

src_install() {
	dobin mjs/build/mjs
	dodoc README.md
}

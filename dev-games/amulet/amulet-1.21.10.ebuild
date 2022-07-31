# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="lua game toolkit"
HOMEPAGE="https://github.com/ianmaclarty/amulet"
SRC_URI="https://github.com/ianmaclarty/amulet/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	rm -rf third_party/SDL2-prebuilt
}

src_install() {
	dobin amulet
	dodoc README.md
}

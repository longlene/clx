# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Portable Event Library"
HOMEPAGE="https://github.com/troglobit/pev"
SRC_URI="https://github.com/troglobit/pev/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dolib.a libpev.a
	insinto /usr/include
	doins pev.h
	dodoc README.md UNLICENSE
}

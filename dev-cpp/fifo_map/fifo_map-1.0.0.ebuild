# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A FIFO-ordered associative container for C++"
HOMEPAGE="https://github.com/nlohmann/fifo_map"
SRC_URI="https://github.com/nlohmann/fifo_map/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

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
	doheader src/fifo_map.hpp
	einstalldocs
}

# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Encode binary files to printable utf16be"
HOMEPAGE="https://github.com/fumiama/base16384"
SRC_URI="https://github.com/fumiama/base16384/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -e "s#DESTINATION lib#DESTINATION $(get_libdir)#" \
		-i CMakeLists.txt
	cmake_src_prepare
}

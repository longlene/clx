# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Generate short YouTube-looking IDs from numbers"
HOMEPAGE="https://sqids.org/cpp"
SRC_URI="https://github.com/sqids/sqids-cpp/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -e '/add_subdirectory/{/tests/d}' \
		-i CMakeLists.txt
	cmake_src_prepare
}

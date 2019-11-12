# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="A C library for parsing and generating CBOR"
HOMEPAGE="https://github.com/PJK/libcbor"
SRC_URI="https://github.com/PJK/libcbor/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""


CMAKE_BUILD_TYPE=Release
CMAKE_MAKEFILE_GENERATOR=emake

src_prepare() {
	default
	sed -i '/subdirs/{/examples/d}' CMakeLists.txt
	cmake-utils_src_prepare
}

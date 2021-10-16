# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="mimalloc is a compact general purpose allocator with excellent performance"
HOMEPAGE="https://github.com/microsoft/mimalloc"
SRC_URI="https://github.com/microsoft/mimalloc/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

CMAKE_BUILD_TYPE="Release"

src_configure() {
	local mycmakeargs=(
		-DMI_BUILD_TESTS=OFF
	)
	cmake_src_configure
}

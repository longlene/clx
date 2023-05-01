# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Find memory leaks in Linux and macOS applications"
HOMEPAGE="https://github.com/d99kris/heapusage"
SRC_URI="https://github.com/d99kris/heapusage/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -e "/install/{s#DESTINATION lib#DESTINATION $(get_libdir)#}" \
		-i CMakeLists.txt
	cmake_src_prepare
}

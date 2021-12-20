# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Fast binary logger for C++"
HOMEPAGE="https://github.com/p-ranav/binary_log"
SRC_URI="https://github.com/p-ranav/binary_log/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -e '/CMAKE_INSTALL_INCLUDEDIR/{s#include/binary_log#include#}' \
		-i cmake/install-rules.cmake
	cmake_src_prepare
}

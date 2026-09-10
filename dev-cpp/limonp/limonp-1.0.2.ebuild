# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="C++ header-only utility library with a Python-style API"
HOMEPAGE="https://github.com/yanyiwu/limonp"
SRC_URI="https://github.com/yanyiwu/limonp/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

src_configure() {
	local mycmakeargs=(
		# ENABLE_UNIT_TESTS pulls in test/unittest, which FetchContent_Declare()s
		# googletest from GitHub -- unreachable under the network sandbox, and
		# unneeded since this is a header-only library.
		-DENABLE_UNIT_TESTS=OFF
	)
	cmake_src_configure
}

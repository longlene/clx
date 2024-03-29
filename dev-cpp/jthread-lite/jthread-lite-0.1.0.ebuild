# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="C++20's jthread for C++11 and later in a single-file header-only library"
HOMEPAGE="https://github.com/martinmoene/jthread-lite"
SRC_URI="https://github.com/martinmoene/jthread-lite/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSL-1.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DJTHREAD_LITE_OPT_BUILD_TESTS=OFF
	)
	cmake_src_configure
}

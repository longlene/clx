# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A single-file header-only version of a C++17-like string_view for C++98, C++11 and later"
HOMEPAGE="https://github.com/martinmoene/string-view-lite"
SRC_URI="https://github.com/martinmoene/string-view-lite/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSL-1.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DSTRING_VIEW_LITE_OPT_BUILD_TESTS=OFF
	)
	cmake_src_configure
}

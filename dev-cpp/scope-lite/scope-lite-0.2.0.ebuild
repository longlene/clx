# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Generic scope and RAII Wrapper"
HOMEPAGE="https://github.com/martinmoene/scope-lite"
SRC_URI="https://github.com/martinmoene/scope-lite/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSL-1.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DSCOPE_LITE_OPT_BUILD_TESTS=OFF
	)
	cmake_src_configure
}

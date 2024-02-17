# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

DESCRIPTION="StringZilla"
HOMEPAGE="https://github.com/ashvardanian/StringZilla"
SRC_URI="https://github.com/ashvardanian/StringZilla/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DSTRINGZILLA_INSTALL=ON
		-DSTRINGZILLA_BUILD_TEST=OFF
		-DSTRINGZILLA_BUILD_BENCHMARK=OFF
		-DSTRINGZILLA_INCLUDE_INSTALL_DIR=/usr/include
	)
	#-DSTRINGZILLA_BUILD_SHARED=ON
	cmake_src_configure
}

# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Open source library for building editors that can handle massive files, and multiple viewports"
HOMEPAGE="https://github.com/ctc-oss/omega-edit"
SRC_URI="https://github.com/ctc-oss/omega-edit/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

CMAKE_USE_DIR="${S}"/core

src_configure() {
	local mycmakeargs=(
		-DBUILD_TESTS=OFF
		-DBUILD_DOCS=OFF
		-DBUILD_EXAMPLES=OFF
	)
	cmake_src_configure
}

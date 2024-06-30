# Copyright 2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Compiler infrastructure and toolchain library for WebAssembly"
HOMEPAGE="https://github.com/WebAssembly/binaryen"
SRC_URI="
https://github.com/WebAssembly/binaryen/archive/refs/tags/version_${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"/${PN}-version_${PV}

src_configure() {
	local mycmakeargs=(
		-DENABLE_WERROR=OFF
		-DBUILD_TESTS=OFF
	)
	cmake_src_configure
}

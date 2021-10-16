# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake

DESCRIPTION="Compiler infrastructure and toolchain library for WebAssembly"
HOMEPAGE="https://github.com/WebAssembly/binaryen"
SRC_URI="https://github.com/WebAssembly/binaryen/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
	-DENABLE_WERROR=OFF
	)
	cmake_src_configure
}

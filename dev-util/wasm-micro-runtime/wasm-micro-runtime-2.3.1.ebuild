# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="WebAssembly Micro Runtime"
HOMEPAGE="https://github.com/bytecodealliance/wasm-micro-runtime"
SRC_URI="
	https://github.com/bytecodealliance/wasm-micro-runtime/archive/refs/tags/WAMR-${PV}.tar.gz -> ${P}.gh.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/${PN}-WAMR-${PV}

src_prepare() {
	default
	eapply "${FILESDIR}"/system-simde.patch
	find . -name 'CMakeLists.txt' -exec sed -e "s#DESTINATION lib#DESTINATION $(get_libdir)#" -i {} \;
	cmake_src_prepare
}

# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

DESCRIPTION="Tiny Erlang VM"
HOMEPAGE="https://github.com/bettio/AtomVM"
SRC_URI="https://github.com/bettio/AtomVM/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

CMAKE_SYSTEM_NAME=Linux

src_prepare() {
	default
	sed -e '/add_library/{s#{PLATFORM_LIB_SUFFIX}#{PLATFORM_LIB_SUFFIX} STATIC#}' \
		-i src/platforms/generic_unix/lib/CMakeLists.txt
	sed -e '/add_library/{s#libAtomVM#libAtomVM STATIC#}' \
		-i src/libAtomVM/CMakeLists.txt
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DAVM_BUILD_RUNTIME_ONLY=ON
	)
	cmake_src_configure
}


# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="High performance typed Python compiler"
HOMEPAGE="
	https://lpython.org/
	https://github.com/lcompilers/lpython
"
SRC_URI="https://github.com/lcompilers/lpython/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
BDEPEND=""

CMAKE_BUILD_TYPE=Debug

src_prepare() {
	default
	sed -e '/ci\/version.sh/d' \
		-i build0.sh
	echo ${PV} > version
	./build0.sh || die "prepare failed"
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DLPYTHON_BUILD_ALL=ON
		-DWITH_LFORTRAN_BINARY_MODFILES=OFF
		-DWITH_STACKTRACE=ON
		-DWITH_RUNTIME_STACKTRACE=ON
		-DWITH_ZLIB=OFF
	)
	cmake_src_configure
}

src_install() {
	dolib.so ${BUILD_DIR}/src/lpython/liblpython_lib.so
	cmake_src_install
}


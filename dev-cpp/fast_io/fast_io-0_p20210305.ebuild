# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

EGIT_COMMIT="aebcba5e01f7d2d42a0d1bddc1bcaf24436c6540"

DESCRIPTION="general-purpose exception-safe RAII I/O library based on C++ 20 Concepts"
HOMEPAGE="https://github.com/expnkx/fast_io"
SRC_URI="https://github.com/expnkx/fast_io/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -i '/DESTINATION/{s#man/man3#share/man/man3#}' CMakeLists.txt
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_I18N_DLLS=OFF
	)
	cmake_src_configure
}

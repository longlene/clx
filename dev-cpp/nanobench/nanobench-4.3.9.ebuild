# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Simple, fast, accurate single-header microbenchmarking functionality"
HOMEPAGE="https://nanobench.ankerl.com/"
SRC_URI="https://github.com/martinus/nanobench/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -e '/set(INSTALL_CONFIGDIR/{s#/${PROJECT_NAME}##}' \
		-e '/set(INSTALL_LIBDIR/{s#/${PROJECT_NAME}##}' \
		-i CMakeLists.txt
	cmake_src_prepare
}

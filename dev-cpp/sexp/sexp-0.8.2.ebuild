# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="C++ Library for SEXP"
HOMEPAGE="https://github.com/rnpgp/sexp"
SRC_URI="https://github.com/rnpgp/sexp/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DWITH_SEXP_TESTS=OFF
		-DDOWNLOAD_GTEST=OFF
	)
	cmake_src_configure
}

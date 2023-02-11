# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="WHATWG-compliant URL parser written in modern C++"
HOMEPAGE="https://github.com/ada-url/ada"
SRC_URI="https://github.com/ada-url/ada/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DBUILD_TESTING=OFF
		-DADA_BENCHMARKS=OFF
	)
	cmake_src_configure
}

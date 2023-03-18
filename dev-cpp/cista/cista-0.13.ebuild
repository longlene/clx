# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Simple C++ Serialization & Reflection"
HOMEPAGE="https://cista.rocks/"
SRC_URI="https://github.com/felixguendling/cista/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DCISTA_HASH=FNV1A
	)
	cmake_src_configure
}

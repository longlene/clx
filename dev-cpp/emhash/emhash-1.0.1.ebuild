# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Fast and memory efficient c++ flat hash table/map/set"
HOMEPAGE="https://github.com/ktprime/emhash"
SRC_URI="https://github.com/ktprime/emhash/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
	"${FILESDIR}"/install-fix.patch
)

src_configure() {
	local mycmakeargs=(
		-DWITH_BENCHMARKS=OFF
	)
	cmake_src_configure
}

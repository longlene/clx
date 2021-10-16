# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake vcs-snapshot

DESCRIPTION="Roaring bitmaps in C (and C++)"
HOMEPAGE="http://roaringbitmap.org/"
SRC_URI="https://github.com/RoaringBitmap/CRoaring/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
	-DENABLE_ROARING_TESTS=OFF
	)
	cmake_src_configure
}

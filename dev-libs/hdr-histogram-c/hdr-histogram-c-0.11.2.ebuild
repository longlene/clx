# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake vcs-snapshot

DESCRIPTION="C port of the HdrHistogram"
HOMEPAGE="https://github.com/HdrHistogram/HdrHistogram_c"
SRC_URI="https://github.com/HdrHistogram/HdrHistogram_c/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	sys-libs/zlib
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
	-DHDR_HISTOGRAM_BUILD_PROGRAMS=OFF
	)
	cmake_src_configure
}

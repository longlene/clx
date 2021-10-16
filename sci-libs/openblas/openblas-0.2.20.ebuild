# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake vcs-snapshot

DESCRIPTION="Optimized BLAS library based on GotoBLAS2"
HOMEPAGE="http://xianyi.github.com/OpenBLAS/"
SRC_URI="http://github.com/xianyi/OpenBLAS/tarball/v${PV} -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x86-macos ~ppc-macos ~x64-macos"
IUSE="dynamic openmp static-libs threads"

RDEPEND=""
DEPEND="${RDEPEND}
	sys-devel/gcc[fortran]
	virtual/pkgconfig"

src_configure() {
	local mycmakeargs=(
	-DDYNAMIC_ARCH=$(usex dynamic)
	)
	cmake_src_configure
}


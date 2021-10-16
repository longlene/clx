# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="C/C++ Performance Profiler"
HOMEPAGE="https://orbitprofiler.com"
SRC_URI="https://github.com/google/orbit/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="qt"

DEPEND="
	dev-libs/cereal
	qt? ( dev-qt/qtcore dev-qt/qtwidgets )
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
	-DWITH_GUI=$(usex qt)
	)
	cmake_src_configure
}


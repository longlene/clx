# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

DESCRIPTION="High-performance regular expression matching library"
HOMEPAGE="https://01.org/hyperscan"
SRC_URI="https://github.com/01org/hyperscan/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="static"

DEPEND="
	dev-libs/boost
	dev-util/ragel
"
RDEPEND="${DEPEND}"

CMAKE_BUILD_TYPE=Release

src_configure() {
	local mycmakeargs=(
	-DBUILD_SHARED_LIBS=$(usex !static)
	-DBUILD_STATIC_AND_SHARED=$(usex static)
	)
	cmake-utils_src_configure
}

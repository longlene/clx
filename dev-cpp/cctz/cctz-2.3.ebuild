# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="The Civil-Time and Time-Zone Library"
HOMEPAGE="https://github.com/google/cctz"
SRC_URI="https://github.com/google/cctz/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
	-DBUILD_TOOLS=OFF
	-DBUILD_EXAMPLES=OFF
	-DBUILD_TESTING=OFF
	)
	cmake_src_configure
}

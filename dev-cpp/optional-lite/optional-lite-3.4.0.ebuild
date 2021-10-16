# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="optional lite"
HOMEPAGE="https://github.com/martinmoene/optional-lite"
SRC_URI="https://github.com/martinmoene/optional-lite/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSL-1.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
	-DOPTIONAL_LITE_OPT_BUILD_TESTS=OFF
	)
	cmake_src_configure
}
